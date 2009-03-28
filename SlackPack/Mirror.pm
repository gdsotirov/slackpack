#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2007  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# This class provides support for site mirrors
#
# $Id: Mirror.pm,v 1.5 2009/03/28 20:19:09 gsotirov Exp $
#

package SlackPack::Mirror;

use strict;
use SlackPack;
use MIME::Base64;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'mirrors';
use constant ORDER_FIELD => 'id';
use constant REQUIRED_FIELDS => qw(name home_url loc_country loc_continent);

use constant DB_TABLE_DTL => 'mirrors_dtl';
use constant ORDER_FIELD_DTL => 'protocol';
use constant REQUIRED_FIELDS_DTL => qw(mirror protocol url);

sub DB_COLUMNS {
  return qw(id
            name
            home_url
            loc_city
            loc_country
            loc_continent
            speed_local
            speed_int
            sync_hours
            sync_start
            logo
            prime);
}

sub DB_COLUMNS_DTL {
  return qw(id mirror protocol url);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  if ( $self->{logo} ) {
    $self->{logo} = encode_base64($self->{logo});
  }

  return $self;
}

sub prime {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;

  my $prime_id = $dbh->selectcol_arrayref(qq{
    SELECT max($id_field)
      FROM $table
     WHERE prime = 1})->[0];

  my $self = $class->SUPER::new($prime_id);
  if ( $self->{logo} ) {
    $self->{logo} = encode_base64($self->{logo});
  }

  return $self;
}

sub _init {
  my $class = shift;
  my ($id) = @_;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $columns = join(', ', $class->DB_COLUMNS);

  my $object;
  # Identifier is already checked to be all numeric or all character value
  if ( defined $id ) {
    $object = $dbh->selectrow_hashref(qq{
      SELECT $columns
        FROM $table
       WHERE $id_field = } . $dbh->quote($id));
  }

  if ( !$object ) {
    my $error = {};
    bless $error, $class;
    $error->{'id'} = $id;
    $error->{'error'} = 'NotFound';

    return $error;
  }
  else {
    my $table_dtl = $class->DB_TABLE_DTL;
    my $columns_dtl = join(', ', $class->DB_COLUMNS_DTL);
    my $order_dtl = $class->ORDER_FIELD_DTL;
    my $mirror = $object->{'id'};

    $object->{'protocols'} = $dbh->selectall_arrayref(qq{
      SELECT $columns_dtl
        FROM $table_dtl
       WHERE mirror = } . $dbh->quote($mirror) . qq{
       ORDER BY $order_dtl }, { Slice => {} });
  }

  return $object;
}

# Management routines
sub add {
}

sub edit {
}

sub remove {

}

1;


__END__

=head1 NAME

SlackPack::Mirror - Class that implements mirror support

=head1 SYNOPSIS

my $mirror = new SlackPack::Mirror(1);

print "Mirror " . $arch->{name} . " supports " . $arch->{protocol} . " protocol.";
$mirror->get_all;

=head1 DESCRIPTION

This is a class which provides support for site mirrors. It incorprorates
all the data for the mirror and provides method for listing all
site mirrors.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the mirrors is 'mirrors'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a mirror object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the mirror, which
                    is string.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined mirrors in the database.

 Returns:     List of fully initialized mirror objects.

=back

=head2 Database manipulation

=over

=item C<add>

 Description:

 Returns:

=item C<edit>

 Description:

 Returns:

=item C<remove>

 Description:

 Returns:

=back

