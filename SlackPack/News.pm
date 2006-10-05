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
# This module deals with site news
#
# $Id: News.pm,v 1.5 2006/10/05 17:24:33 gsotirov Exp $
#

package SlackPack::News;

use strict;
use SlackPack;
use Date::Parse;

use constant TABLE => 'news';

sub get {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT ";
  $query   .= " `title`, `body`, `published`, `author` ";
  $query   .= "FROM ".TABLE." ";
  $query   .= "WHERE `id` = $_[0]";
  my $news = $dbh->selectall_arrayref($query);

  if ( !$news ) {
    return [];
  }

  $news->{'published'} = str2time($news->{'published'});

  return $news;
}

sub get_all {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT ";
  $query   .= " `id`, `title`, `body`, `published`, `author` ";
  $query   .= "FROM ".TABLE." ";
  $query   .= "ORDER BY `published` DESC";
  my $news = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$news ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$news}; ++$i ) {
      $news->[$i]->{'published'} = str2time($news->[$i]->{'published'});
    }
  }

  return $news;
}

sub get_latest_headers {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT ";
  $query   .= " `id`, `title`, `published` ";
  $query   .= "FROM ".TABLE." ";
  $query   .= "ORDER BY `published` DESC ";
  $query   .= "LIMIT 5";
  my $news = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$news ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$news}; ++$i ) {
      $news->[$i]->{'published'} = str2time($news->[$i]->{'published'});
    }
  }

  return $news;
}

sub get_latest {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT ";
  $query   .= " p.`id`, p.`title`, p.`body`, p.`published`, p.`updated`, ";
  $query   .= " a.`name` AS `aname`, a.`firstname` AS `afirstname`, a.`email` AS `aemail` ";
  $query   .= "FROM ";
  $query   .= " ".TABLE." p, authors a ";
  $query   .= "WHERE p.`author` = a.`id` ";
  $query   .= "ORDER BY `published` DESC ";
  $query   .= "LIMIT 10";
  my $news = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$news ) {
    return [];
  }
  else {
    # Reformat data
    for ( my $i = 0; $i < scalar @{$news}; ++$i ) {
      $news->[$i]->{'published'} = str2time($news->[$i]->{'published'});
      $news->[$i]->{'updated'} = str2time($news->[$i]->{'updated'});
    }
  }

  return $news;
}

sub add {
  my $dbh = SlackPack->dbh;
  my $title = $dbh->quote($_[0]->{'title'});
  my $body = $dbh->quote($_[0]->{'body'});
  my $dt = $dbh->quote($_[0]->{'datetime'});
  my $auth = $dbh->quote($_[0]->{'author'});

  my $query = "INSERT (`title`, `body`, `datetime`, `author`) INTO ".TABLE." VALUES ($title, $body, $dt, $auth)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $title = $dbh->quote($_[0]->{'title'});
  my $body = $dbh->quote($_[0]->{'body'});
  my $dt = $dbh->quote($_[0]->{'datetime'});
  my $auth = $dbh->quote($_[0]->{'author'});

  my $query = "UPDATE ".TABLE." SET `title` = $title, `body` = $body, `datetime` = $dt, `author` = $auth WHERE `id` = $_[0]";
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

