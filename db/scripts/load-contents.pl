#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2026  Georgi D. Sotirov, gdsotirov@gmail.com
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
# Load package contents into the database
#

use lib qw(../..);
use SlackPack;
use SlackPack::Package;

my $dbh = SlackPack->dbh;

my $ids = $dbh->selectcol_arrayref("SELECT id FROM packages WHERE contents IS NULL ORDER BY id");

foreach my $id (@$ids) {
  my $pack = new SlackPack::Package($id);
  printf("Processing package #%d (%s) at %s... ", $id, $pack->{status}, $pack->get_local_url);
  my $contents = $pack->list_contents;
  printf("DONE (%d bytes)\n", length($contents));
  if ( length($contents) > 0 ) {
    my $sth = $dbh->prepare("UPDATE packages SET contents = ? WHERE id = ?");
    $sth->execute($contents, $id);
  }
}

