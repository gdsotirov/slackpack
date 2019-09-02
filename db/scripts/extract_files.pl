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
# Extract files from package contents and load into JSON column
#

use lib qw(../..);
use SlackPack;
use SlackPack::Package;

my $dbh = SlackPack->dbh;

my $ids = $dbh->selectcol_arrayref("SELECT id FROM packages WHERE contents IS NOT NULL AND contents_json IS NULL ORDER BY id");

foreach my $id (@$ids) {
  printf "Extracting files for #%d... ", $id;
  my $sth = $dbh->prepare("UPDATE packages SET contents_json = extract_files(contents) WHERE id = ?");
  $sth->execute($id);
  print "DONE.\n";
}

