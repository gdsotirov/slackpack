#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2023  Georgi D. Sotirov, gdsotirov@gmail.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# DESCRIPTION:
# Slackpack error management module
#

package SlackPack::Error;

use strict;
use SlackPack;
use Date::Parse;

use base qw(Exporter);
use base qw(SlackPack::Object);

use constant DB_TABLE => 'errors';
use constant REQUIRED_FIELDS => qw(errcode errmsg source type level);

@SlackPack::Error::EXPORT = qw(ThrowCodeError ThrowUserError ThrowTemplateError);

sub DB_COLUMNS {
  return qw(
    id
    errcode
    errmsg
    source
    type
    level
    date);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  $self->{date} = str2time($self->{date});

  return $self;
}

sub record {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my ($err) = @_;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my @qmarks = ();
  my @values = ();
  my ($idx) = split(/\n/, $class->REQUIRED_FIELDS);

  while ( $idx-- > 0 ) {
    push @qmarks, '?';
  }

  my $query  = "INSERT INTO $table (\n";
     $query .= join(', ', $class->REQUIRED_FIELDS);
     $query .= ") VALUES (";
     $query .= join(', ', @qmarks);
     $query .= ")";

  my $sth = $dbh->prepare($query);

  $idx = 0;
  foreach my $clmn ( $class->REQUIRED_FIELDS ) {
    $values[$idx++] = $err->{$clmn};
  }

  $sth->execute(@values);

  if ( $dbh->err ) {
    my $error = {};
    bless $error, $class;
    $error->{'id'} = $err->{name};
    $error->{'error'} = $dbh->errstr;

    return -1;
  }

  return new SlackPack::Error($dbh->{'mysql_insertid'});
}

sub remove {
  my $self = shift;
  my $dbh = SlackPack->dbh;
  my $table = $self->DB_TABLE;
  my $id_field = $self->ID_FIELD;

  my $query  = "DELETE FROM $table\n";
     $query .= " WHERE $id_field = ".$self->id;

  $dbh->do($query);

  if ( $dbh->err ) {
    return throw_error("DML_error", {});
  }

  return 0;
}

sub throw_error {
  my ($name, $error, $vars) = @_;

  $vars->{'error'} = $error;

  my $template = SlackPack->template;

  print SlackPack->cgi->header('text/html', -status => '404 Not Found');
  $template->process($name, $vars) || ThrowTemplateError($template->error());
}

sub ThrowUserError {
  my ($name, $err) = @_;

  $err->{errcode}= $name;
  $err->{errmsg} = $err->{id};
  $err->{type}   = $err->{type} || 'usr';
  $err->{level}  = $err->{level} || 'err';

  SlackPack::Error->record($err);

  throw_error("global/error-user.html.tmpl", @_);
}

sub ThrowCodeError {
  my ($name, $err) = @_;

  $err->{errcode}= $name;
  $err->{type}   = $err->{type} || 'sys';
  $err->{level}  = $err->{level} || 'err';

  SlackPack::Error->record($err);

  throw_error("global/error-code.html.tmpl", @_);
}

sub ThrowTemplateError {
  my ($template_error) = @_;

  my $template = SlackPack->template;

  my $vars = {};
  $vars->{'error_msg'} = $template_error;
  $vars->{'error'} = "template_error";

  if (!$template->process("global/code-error.html.tmpl", $vars)) {
    print <<END;
    <p class="error">The site has suffered an internal error. Please, save
    this page and send it to gdsotirov\@gmail.com with details of what you were
    doing at the time this message appeared.<br />
    The Template framework returned: <code>$template_error</code></p>
END
  }
}

1;


__END__

=head1 NAME

SlackPack::Error - Error handling for SlackPack

=head1 SYNOPSIS

my $vendor = new SlackPack::Error(1);

print "Error happened = " . $vendor->{date};
print "Error string   = " . $error->
$error->record({type => 'db', level => 'err'});

=head1 DESCRIPTION

This class is encapsulating error handling routines for SlackPack.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the errors is 'errors'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a vendor object from
              the database by its identifier.

 Params:      $id - Identifier of the vendor in the database

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined vendors in the database.

 Returns:     List of fully initialized vendor objects.

=back

=head2 Database manipulation

=over

=item C<record>

 Description: Records the error into the database

 Returns: zero on success

=item C<remove>

 Description: Deletes error from the database

 Returns: zero on success

=back


