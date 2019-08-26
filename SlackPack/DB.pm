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
# The Perl modules used to do all the dirty work
#

package SlackPack::DB;

use strict;
use DBI;
use Filter::Include;
use SlackPack;
use SlackPack::Error;

# Defaults
our $sp_db   = 'slackpack';
our $sp_host = 'localhost';
our $sp_port = 3306;
our $sp_sock = '/var/mysql/mysqld.sock';
our $sp_user = 'slackpack';
our $sp_pass = 'very.secret';

# Override variables with local config
include "slackpack.pl.inc";

sub connect {
  my $dsn = "DBI:mysql:database=$sp_db;host=$sp_host;port=$sp_port;mysql_socket=$sp_sock";
  my $res = DBI->connect($dsn, $sp_user, $sp_pass, {'RaiseError' => 0});

  if ( $DBI::err ) {
    $res = {};

    ThrowCodeError("connect_db", {type    => 'db',
                                  level   => 'err',
                                  errcode => $DBI::err,
                                  errmsg  => $DBI::errstr});
  }

  return $res;
}

sub disconnect {
  my $dbh = $_[0];
  $dbh->disconnect;
}

1;

