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
# This is representation of the packages
#
# $Id: Package.pm,v 1.1 2006/07/06 19:58:12 gsotirov Exp $
#

package SlackPack::Package;

use strict;
use SlackPack;

use constant TABLE => 'slackpack';

sub new {
  my $class = shift;
  my $self = {};
  bless($self, $class);
  return $self;
}

sub get {
  my $dbh = SlackPack->dbh;
  my $query  = "SELECT ";
     $query .= " `name`, `version`, `build`, `license`, ";
     $query .= " `arch`, `slackver`, ";
     $query .= " `desc', ";
     $query .= " `filename`, `filesize`, `fileurl`, `filemd5`, `filesign`, `date`, `time` ";
     $query .= "FROM ".TABLE." WHERE `id` = $_[0]";
  my $pack = $dbh->selectall_arrayref($query);

  if ( !$pack ) {
    return [];
  }

  return $pack;
}

sub get_name {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id` FROM ".TABLE." WHERE `name` = $_[0] ORDER BY `date` DESC, `time` DESC";
  my $names = $dbh->selectall_hashref($query, 'id');

  if ( !$names ) {
    return {};
  }

  return $names;
}


sub get_all {
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " `name`, `version`, `build`, `license`, ";
     $query .= " `arch`, `slackver`, ";
     $query .= " `desc', ";
     $query .= " `filename`, `filesize`, `fileurl`, `filemd5`, `filesign`, `date`, `time` ";
     $query .= "FROM ".TABLE." ORDER BY `date` DESC, `time` DESC";
  my $lics = $dbh->selectall_hashref($query, 'id');

  if ( !$lics ) {
    return {};
  }

  return $lics;
}

sub add {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT 1+1";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT 1+1";
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

