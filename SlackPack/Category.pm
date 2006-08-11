#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# This is representation of the categories for the packages
#
# $Id: Category.pm,v 1.1 2006/08/11 21:23:07 gsotirov Exp $
#

package SlackPack::Category;

use strict;
use SlackPack;

use constant TABLE => 'categories';

sub get {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `name`, `count` FROM ".TABLE." WHERE `id` = $_[0]";
  my $cat = $dbh->selectall_arrayref($query);

  if ( !$cat ) {
    return [];
  }

  return $cat;
}

sub get_all {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id`, `name`, `count` FROM ".TABLE." ORDER BY `name`";
  my $cats = $dbh->selectall_hashref($query, 'id');

  if ( !$cats ) {
    return {};
  }

  return $cats;
}

sub add {
  my $dbh = SlackPack->dbh;
  my $name = $dbh->quote($_[0]->{'name'});

  my $query = "INSERT (`name`) INTO ".TABLE." VALUES ($name)";
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

  my $query = "UPDATE ".TABLE." SET `name` = $name WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

  my $query = "DELETE FROM ".TABLE." WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

1;

