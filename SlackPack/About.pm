#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2019  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# This is module for extracting of service information and statistics
#

package SlackPack::About;

use strict;
use SlackPack;

sub get_totals {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM Totals";
  return $dbh->selectrow_array($query);
}

sub get_percent_sb {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT percent_sb()";
  my @res = $dbh->selectrow_arrayref($query);

  if ( !@res ) {
    return sprintf("%.2f", 0.0);
  }

  return sprintf("%.2f", $res[0][0]);
}

sub get_percent_cur {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT percent_cur()";
  my @res = $dbh->selectrow_arrayref($query);

  if ( !@res ) {
    return sprintf("%.2f", 0.0);
  }

  return sprintf("%.2f", $res[0][0]);
}

sub get_percent_binrel {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT percent_binrel()";
  my @res = $dbh->selectrow_arrayref($query);

  if ( !@res ) {
    return sprintf("%.2f", 0.0);
  }

  return sprintf("%.2f", $res[0][0]);
}

sub get_dstrbtn_by_arch {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT * FROM DstrbtnByArch";
  my $res = $dbh->selectall_arrayref($query, { Slice => {} });

  if ( !$res ) {
    return {};
  }

  return $res;
}

1;

