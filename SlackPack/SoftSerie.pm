#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2020  Georgi D. Sotirov, gdsotirov@gmail.com
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
# This is representation of software serie
#

package SlackPack::SoftSerie;

use strict;
use SlackPack;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'soft_series';
use constant ORDER_FIELD => 'title';
use constant REQUIRED_FIELDS => qw(title);

sub DB_COLUMNS {
  return qw(id
            title);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  return $class->SUPER::new(@_);
}

# Management routines
sub add {
  my $dbh = SlackPack->dbh;
  my $title = $dbh->quote($_[0]->{'title'});

  my $query = "INSERT (title) INTO ".DB_TABLE." VALUES ($title)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[0]->{'id'});
  my $title = $dbh->quote($_[0]->{'title'});

  my $query = "UPDATE ".DB_TABLE." SET title = $title WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

  my $query = "DELETE FROM ".DB_TABLE." WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

1;

__END__

=head1 NAME

SlackPack::SoftSerie - A general representation of a software serie

=head1 SYNOPSIS

my $ser = new SlackPack::SoftSerie(3);

print "Serie title = " . $ser->{title};
$ser->get_all;

=head1 DESCRIPTION

This is a class which represents a software serie for slackware packages. It
incorprorates all the data of the serie and provides method
for listing all available series.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the software sereies is 'soft_series'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a software serie object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the serie, which
                    is integer.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined categories in the database.

 Returns:     List of fully initialized software series objects.

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

