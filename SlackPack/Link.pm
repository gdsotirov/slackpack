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
# This is representation of a link
#

package SlackPack::Link;

use strict;
use SlackPack;
use base qw(SlackPack::Object);

use constant DB_TABLE => 'links';
use constant REQUIRED_FIELDS => qw(title title_bg url);
use constant ORDER_FIELD => 'priority';

sub DB_COLUMNS {
  return qw(
    id
    title
    title_bg
    url
    type
    status);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);

  return $self;
}

sub get_active_by_type {
  my $class = shift;
  my $type = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field\n";
     $query .= "  FROM $table\n";
     $query .= " WHERE type   = '$type'\n";
     $query .= "   AND status = 'active'\n";
     $query .= " ORDER BY $order_field ASC\n";

  my $ids = $dbh->selectcol_arrayref($query);

  my $links = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$links, $new_obj;
  }

  return $links;
}

1;


__END__

=head1 NAME

SlackPack::User - A general representation of a link

=head1 SYNOPSIS

my $link = new SlackPack::link(1);

print "Link title = " . $link->{title};
$link->get_all;
$link->get_active_by_type('leftbar');

=head1 DESCRIPTION

This is a class, which represents a link. It incorporates all the data
for the link and provides general functionality.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the users is 'links'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a link object from
              the database by its identifier.

 Params:      $id - Identifier of the vendor in the database

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined links in the database.

 Returns:     List of fully initialized vendor objects.

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

