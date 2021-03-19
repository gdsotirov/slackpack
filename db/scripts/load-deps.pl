#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2021  Georgi D. Sotirov, gdsotirov@gmail.com
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

my $ins_q  = "INSERT INTO package_deps";
   $ins_q .= " (pack_id, dep_type, dep_name, dep_sign, dep_version) ";
   $ins_q .= "VALUES";
   $ins_q .= " (?, ?, ?, ?, ?)";
my $sth = $dbh->prepare($ins_q);

sub process_file {
  my ($pkg, $file) = @_;

  my $pkg_url = $pkg->get_local_url;
  my $out = `tar xOf $pkg_url $file 2>/dev/null`;
  print(" - $file: ");
  if ( $? != 0 ) {
    print("n/a\n");
  }
  else {
    my $type;
    if ( $file =~ 'required$' ) {
      $type = 'req';
    }
    elsif ( $file =~ 'suggests$' ) {
      $type = 'sugg';
    }
    elsif ( $file =~ 'conflicts$' ) {
      $type = 'conf';
    }

    register_deps($pkg, $type, $out);

    $out =~ s/\n/; /g;
    print "$out\n";
  }
}

sub register_deps {
  my ($pkg, $type, $out) = @_;
  my $dep_name;
  my $dep_sign;
  my $dep_ver;

  my @lines = split(/\n/, $out);
  foreach my $ln (@lines) {
    $dep_name = undef;
    $dep_sign = undef;
    $dep_ver  = undef;
    # only package name
    if ( $ln =~ /^([a-zA-Z_+\-0-9]+)$/ ) {
      $dep_name = $1;
    } # with sign and version
    elsif ( $ln =~ /^([a-zA-Z_+\-0-9]+)\s*([><=]+)\s*(.+)$/ ) {
      $dep_name = $1;
      $dep_sign = $2;
      $dep_ver  = $3;
    }
    # TODO: Alternativies?

    if ( $dep_name ) {
      $sth->execute($pkg->{id}, $type, $dep_name, $dep_sign, $dep_ver);
    }
  }
}

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
    process_file($pack, 'install/slack-required');
    process_file($pack, 'install/slack-suggests');
    process_file($pack, 'install/slack-conflicts');
    print("DONE.\n");
  }
  else {
    printf("Skipping package #%d (%s) at %s: MISSING\n", $id, $pack->{status}, $pack->get_local_url);
  }
}

