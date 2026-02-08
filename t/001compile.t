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
# Check syntax of Perl sources

use strict;
use warnings;

use lib qw(. t);
use Config;
use Test::Files;
use Test::More tests => scalar(@Test::Files::sources);

foreach my $file (@Test::Files::sources) {
  my $out = `perl -c $file 2>&1`;
  chomp($out);
  my $ret_val = $?;
  ok($ret_val eq 0, $file) or diag($out);
}

