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
# This is representation of the licenses for the packages
#
# $Id: License.pm,v 1.1 2006/07/06 19:58:12 gsotirov Exp $
#

package SlackPack::License;

use strict;
use SlackPack;

use constant TABLE => 'licenses';

sub get {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `name`, `url`, `def` FROM ".TABLE." WHERE `id` = $_[0]";
  my $lic = $dbh->selectall_arrayref($query);

  if ( !$lic ) {
    return [];
  }

  return $lic;
}

sub get_name {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id` FROM ".TABLE." WHERE `name` = $_[0]";
  my $id = $dbh->selectrow_arrayref($query);

  if ( !$id ) {
    return [];
  }

  return $id;
}

sub get_all {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id`, `name`, `url`, `default` FROM ".TABLE." ORDER BY `id`";
  my $lics = $dbh->selectall_hashref($query, 'id');

  if ( !$lics ) {
    return {};
  }

  return $lics;
}

sub add {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[0]->{'id'});
  my $name = $dbh->quote($_[0]->{'name'});
  my $url = $dbh->quote($_[0]->{'url'});
  my $def = $_[0]->{'def'};

  my $query = "INSERT (`id`, `name`, `url`, `def`) INTO ".TABLE." VALUES ($id, $name, $url, $def)";
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

  my $query = "UPDATE ".TABLE." SET `id` = $new_id, `name` = $name, `url` = $url, `default` = $def WHERE `id` = $_[0]";
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

  my $query = "DELETE FROM ".TABLE." WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

1;

