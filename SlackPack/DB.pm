#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2007  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# The Perl modules used to do all the dirty work
#
# $Id: DB.pm,v 1.3 2007/05/01 19:41:14 gsotirov Exp $
#

package SlackPack::DB;

use strict;
use DBI;
use Filter::Include;

include "../../slackpack.pl.inc";

sub connect {
  my $dsn = "DBI:mysql:database=$sp_db;host=$sp_host;port=$sp_port;mysql_socket=$sp_sock";
  return DBI->connect($dsn, $sp_user, $sp_pass, {'RaiseError' => 1});
}

sub disconnect {
  my $dbh = $_[0];
  $dbh->disconnect;
}

