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
# Load package requirements into the database
#

use lib qw(../..);
use SlackPack;
use SlackPack::Package;

my $dbh = SlackPack->dbh;

my $curq  = "SELECT id";
   $curq .= "  FROM packages P";
   $curq .= " WHERE NOT EXISTS (SELECT 1";
   $curq .= "                     FROM package_deps";
   $curq .= "                    WHERE pack_id = P.id)";
   $curq .= " ORDER BY id";
my $ids = $dbh->selectcol_arrayref($curq);

foreach my $id (@$ids) {
  my $pack = new SlackPack::Package($id);
  if ( $pack->{contents} ) {
    printf("Processing package #%d (%s) at %s:\n", $id, $pack->{status}, $pack->get_local_url);
    $pack->load_deps();
    print("DONE.\n");
  }
  else {
    printf("Skipping package #%d (%s) at %s: MISSING\n", $id, $pack->{status}, $pack->get_local_url);
  }
}

