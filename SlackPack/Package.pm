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
# $Id: Package.pm,v 1.18 2006/09/28 21:16:45 gsotirov Exp $
#

package SlackPack::Package;

use strict;
use SlackPack;
use Number::Bytes::Human;

use constant TABLE => 'packages';

our $suffixes = [' <abbr title="Bytes">B</abbr>',
                 ' <abbr title="Kilo Bytes">KB</abbr>',
                 ' <abbr title="Mega Bytes">MB</abbr>',
                 ' <abbr title="Giga Bytes">GB</abbr>',
                 ' <abbr title="Tera Bytes">TB</abbr>',
                 ' <abbr title="Peta Bytes">PB</abbr>',
                 ' <abbr title="Exa Bytes">EB</abbr>',
                 ' <abbr title="Zetta Bytes">ZB</abbr>',
                 ' <abbr title="Yotta Bytes">YB</abbr>'];

my $human = new Number::Bytes::Human(bs => 1024, suffixes => $suffixes);

sub new {
  my $class = shift;
  my $self = {};
  bless($self, $class);
  return $self;
}

sub get {
  my $dbh = SlackPack->dbh;
  my $query  = "SELECT ";
     $query .= " p.`name`, p.`version`, p.`releasedate`, p.`build`, ";
     $query .= " l.`name` AS `license`, l.`url` AS `license_url`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack`, ";
     $query .= " p.`url`, p.`desc`, c.`name` AS category, p.`slackbuild`, p.`frombinary`, ";
     $query .= " p.`filename`, p.`filesize`, p.`fileurl`, p.`filemd5`, p.`filesign`, p.`filedate` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `licenses` l, `slackver` s, `categories` c ";
     $query .= "WHERE ";
     $query .= " p.`id` = ".$_[1]." AND p.`arch` = a.`id` AND ";
     $query .= " p.`license` = l.`id` AND p.`slackver` = s.`id` AND p.`category` = c.`id`";
  my $pack = $dbh->selectrow_hashref($query);

  if ( !$pack ) {
    return [];
  }

  $pack->{'filesize_hr'} = $human->format($pack->{'filesize'});

  return $pack;
}

sub get_history {
  my $dbh = SlackPack->dbh;
  my $query  = "SELECT ";
     $query .= " p.`id`, p.`version`, p.`build`, p.`filedate`, p.`filesize`, ";
     $query .= " a.`name` as `arch`, s.`name` as `slack` ";
     $query .= "FROM ";
     $query .= " `packages` p, arch a, slackver s ";
     $query .= "WHERE ";
     $query .= " p.`name` = '$_[1]' AND p.`id` <> $_[2] AND p.`arch` = a.`id` AND p.`slackver` = s.`id` ";
     $query .= "ORDER BY p.`filedate` DESC";
  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }

  return $packs;
}

sub get_name {
  my $dbh = SlackPack->dbh;
  my $name = $dbh->quote($_[0]);

  my $query = "SELECT `id` FROM ".TABLE." WHERE `name` = $name ORDER BY `filedate` DESC";
  my $names = $dbh->selectall_hashref($query, 'id');

  if ( !$names ) {
    return {};
  }

  return $names;
}

sub get_latest {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM Latest25";
  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }

  return $packs;
}

sub get_totals {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM Totals";
  my ($count, $size) = $dbh->selectrow_array($query);

  return ($count, $human->format($size), $size);
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
  my $dbh = SlackPack->dbh;

  my $query  = "SELECT ";
     $query .= " p.`id`, p.`name`, p.`version`, p.`build`, p.`url`, ";
     $query .= " p.`desc`, p.`filedate`, ";
     $query .= " a.`name` AS `arch`, s.`name` AS `slack` ";
     $query .= "FROM ";
     $query .= " `".TABLE."` p, `arch` a, `slackver` s ";
     $query .= "WHERE ";
     $query .= " p.`category` = $_[1] AND p.`arch` = a.`id` AND p.`slackver` = s.`id` ";
     $query .= "ORDER BY ";
     $query .= " p.`filedate` DESC";

  my $packs = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$packs ) {
    return [];
  }

  return $packs;
}

sub get_by_name {
  shift(@_);
  my $dbh = SlackPack->dbh;
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

