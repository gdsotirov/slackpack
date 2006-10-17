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
# This is representation of the different Slackware versions
#
# $Id: Slackver.pm,v 1.4 2006/10/17 21:50:10 gsotirov Exp $
#

package SlackPack::Slackver;

use strict;
use SlackPack;

use constant TABLE => 'slackver';

sub get {
  my $id = $_[1];
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `name`, `default`, `count` FROM ".TABLE." WHERE `id` = ".$dbh->quote($id);
  my $ver = $dbh->selectrow_hashref($query);

  if ( !$ver ) {
    return [];
  }

  return $ver;
}

sub get_name {
  my $name = $_[1];
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id` FROM ".TABLE." WHERE `name` = ".$dbh->quote($name);
  my $id = $dbh->selectrow_arrayref($query, { Slice => {} });

  if ( !$id ) {
    return [];
  }

  return $id;
}

sub get_all {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id`, `name`, `default`, `count` FROM ".TABLE." ORDER BY `released` DESC";
  my $vers = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$vers ) {
    return {};
  }

  return $vers;
}

sub add {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[1]->{'id'});
  my $name = $dbh->quote($_[1]->{'name'});
  my $def = $_[1]->{'def'};

  my $query = "INSERT (`id`, `name`, `def`) INTO ".TABLE." VALUES ($id, $name, $def)";
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
  my $def = $_[1]->{'def'};

  my $query = "UPDATE ".TABLE." SET `id` = $new_id, `name` = $name, `default` = $def WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

  my ($name, $def) = get($_[1]);
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

