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
# $Id: Package.pm,v 1.28 2006/11/10 21:20:29 gsotirov Exp $
#

package SlackPack::Package;

use strict;
use SlackPack;
use Date::Parse;

use constant TABLE => 'packages';

sub new {
  my $class = shift;
  my $self = {};
  bless($self, $class);
  return $self;
}

sub get {
  my $id = $_[1];
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`name`, p.`version`, p.`releasedate`, p.`build`, ";
     $query .= " l.`name` AS `license`, l.`url` AS `license_url`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack`, ";
     $query .= " p.`url`, p.`desc`, c.`name` AS category, p.`slackbuild`, p.`frombinary`, ";
     $query .= " p.`filename`, p.`filesize`, p.`fileurl`, p.`filemd5`, p.`filesign`, p.`filedate` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `licenses` l, `slackver` s, `categories` c ";
     $query .= "WHERE ";
     $query .= " p.`id` = ".$dbh->quote($id)." AND p.`arch` = a.`id` AND ";
     $query .= " p.`license` = l.`id` AND p.`slackver` = s.`id` AND p.`category` = c.`id`";
  my $pack = $dbh->selectrow_hashref($query);

  if ( !$pack ) {
    return [];
  }

  $pack->{'filedate'} = str2time($pack->{'filedate'});

  return $pack;
}

sub get_history {
  shift(@_);
  my ($name, $id) = @_;
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`version`, p.`build`, p.`filedate`, p.`filesize`, ";
     $query .= " a.`name` as `arch`, s.`name` as `slack` ";
     $query .= "FROM ";
     $query .= " `packages` p, arch a, slackver s ";
     $query .= "WHERE ";
     $query .= " p.`name` = ".$dbh->quote($name)." AND p.`id` <> ".$dbh->quote($id)." ";
     $query .= " AND p.`arch` = a.`id` AND p.`slackver` = s.`id` ";
     $query .= "ORDER BY p.`filedate` DESC";
  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$packs}; ++$i ) {
      $packs->[$i]->{'filedate'} = str2time($packs->[$i]->{'filedate'});
    }
  }

  return $packs;
}

sub get_name {
  my $name = $_[1];
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `id` FROM ".TABLE." WHERE `name` = ".$dbh->quote($name)." ORDER BY `filedate` DESC";
  my $names = $dbh->selectall_hashref($query, 'id');

  if ( !$names ) {
    return {};
  }

  return $names;
}

sub get_latest {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM Latest20";
  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$packs}; ++$i ) {
      $packs->[$i]->{'Date'} = str2time($packs->[$i]->{'Date'});
    }
  }

  return $packs;
}

sub get_totals {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM Totals";
  return $dbh->selectrow_array($query);
}

sub get_all {
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " `name`, `version`, `build`, `license`, ";
     $query .= " `arch`, `slackver`, ";
     $query .= " `desc', ";
     $query .= " `filename`, `filesize`, `fileurl`, `filemd5`, `filesign`, `filedate` ";
     $query .= "FROM ".TABLE." ORDER BY `filedate` DESC";
  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return {};
  }

  return $packs;
}

sub get_by_category {
  shift(@_);
  my ($cat, $limit) = @_;
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`name`, p.`version`, p.`build`, p.`url`, ";
     $query .= " p.`desc`, p.`filedate`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack`, ";
     $query .= " u.`name` AS `aname`, u.`firstname` AS `afirstname`, u.`email` AS `aemail` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `slackver` s, `authors` u ";
     $query .= "WHERE ";
     $query .= " p.`category` = ".$dbh->quote($cat)." AND ";
     $query .= " p.`arch` = a.`id` AND ";
     $query .= " p.`slackver` = s.`id` AND ";
     $query .= " p.`author` = u.`id` ";
     $query .= "ORDER BY ";
     $query .= " p.`filedate` DESC ";
     $query .= "LIMIT ".$dbh->quote($limit) if defined $limit;

  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$packs}; ++$i ) {
      $packs->[$i]->{'filedate'} = str2time($packs->[$i]->{'filedate'});
    }
  }

  return $packs;
}

sub get_by_sver {
  shift(@_);
  my ($sver, $limit) = @_;
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`name`, p.`version`, p.`build`, p.`url`, ";
     $query .= " p.`desc`, p.`filedate`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack`, ";
     $query .= " u.`name` AS `aname`, u.`firstname` AS `afirstname`, u.`email` AS `aemail` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `slackver` s, `authors` u ";
     $query .= "WHERE ";
     $query .= " p.`slackver` = ".$dbh->quote($sver)." AND ";
     $query .= " p.`arch` = a.`id` AND ";
     $query .= " p.`slackver` = s.`id` AND ";
     $query .= " p.`author` = u.`id` ";
     $query .= "ORDER BY ";
     $query .= " p.`filedate` DESC ";
     $query .= "LIMIT ".$dbh->quote($limit) if defined $limit;

  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$packs}; ++$i ) {
      $packs->[$i]->{'filedate'} = str2time($packs->[$i]->{'filedate'});
    }
  }

  return $packs;
}

sub get_by_name {
  my $dbh = SlackPack->dbh;

  shift(@_);
  my $termsSQL = "";
  my $count = 0;
  foreach my $term (@_) {
    if ( $count ) {
      $termsSQL .= " OR p.`name` LIKE ".$dbh->quote("%$term%");
    }
    else {
      $termsSQL .= "p.`name` LIKE ".$dbh->quote("%$term%");
    }
    ++$count;
  }

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`name`, p.`version`, p.`build`, p.`url`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `slackver` s ";
     $query .= "WHERE ";
     $query .= " ($termsSQL) AND p.`arch` = a.`id` AND p.`slackver` = s.`id` ";
     $query .= "ORDER BY ";
     $query .= " p.`filedate` DESC";

  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }

  return $packs;
}

sub list_contents {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT `fileurl` FROM `packages` WHERE `id` = ".$dbh->quote($_[1]);
  my $pack = $dbh->selectrow_hashref($query);
  my $file = SlackPack->LOCAL_ROOT."".$pack->{'fileurl'};
  return `tar tzvf $file`;
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

