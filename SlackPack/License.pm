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
# This is representation of package license
#

package SlackPack::License;

use strict;
use SlackPack;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'licenses';
use constant REQUIRED_FIELDS => qw(name url);

sub DB_COLUMNS {
  return qw(id
            name
            description
            url
            def
            packages_total
            packages);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  return $class->SUPER::new(@_);
}

# Management routines
sub add {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[0]->{'id'});
  my $name = $dbh->quote($_[0]->{'name'});
  my $url = $dbh->quote($_[0]->{'url'});
  my $def = $_[0]->{'def'};

  my $query = "INSERT (`id`, `name`, `url`, `def`) INTO ".DB_TABLE." VALUES ($id, $name, $url, $def)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $new_id = $dbh->quote($_[1]->{'id'});
  my $name = $dbh->quote($_[1]->{'name'});
  my $url = $dbh->quote($_[1]->{'url'});
  my $def = $_[1]->{'def'};

  my $query = "UPDATE ".DB_TABLE." SET `id` = $new_id, `name` = $name, `url` = $url, `default` = $def WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

  my ($name, $url, $def) = get($_[0]);
  if ( $def == 'yes' ) {
    return -1;
  }

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

SlackPack::License - A general representation of a package license

=head1 SYNOPSIS

my $lic = new SlackPack::License('GPL');

print "License URL = " . $lic->{url};
$lic->get_all;

=head1 DESCRIPTION

This is a class which represents a Slackware package license. It
incorporates all the data of the license and provides method
for listing all available licenses.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the packages is 'arch'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a architecture object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the architecture, which
                    is a string.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined licenses in the database.

 Returns:     List of fully initialized license objects.

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

