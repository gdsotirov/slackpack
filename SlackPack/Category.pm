#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2021  Georgi D. Sotirov, gdsotirov@gmail.com
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
# This is representation of package category
#

package SlackPack::Category;

use strict;
use SlackPack;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'categories';
use constant ORDER_FIELD => 'name';
use constant REQUIRED_FIELDS => qw(name name_bg);

sub DB_COLUMNS {
  return qw(id
            name
            name_bg
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
  my $name = $dbh->quote($_[0]->{'name'});

  my $query = "INSERT (`name`) INTO ".DB_TABLE." VALUES ($name)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[0]->{'id'});
  my $name = $dbh->quote($_[0]->{'name'});

  my $query = "UPDATE ".DB_TABLE." SET `name` = $name WHERE `id` = $_[0]";
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

SlackPack::Category - A general representation of a package category

=head1 SYNOPSIS

my $cat = new SlackPack::Category(3);

print "Category name = " . $cat->{name};
$cat->get_all;

=head1 DESCRIPTION

This is a class which represents a Slackware package category. It
incorprorates all the data of the category and provides method
for listing all available categories.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the categories is 'categories'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a category object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the category, which
                    is integer.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined categories in the database.

 Returns:     List of fully initialized category objects.

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

