#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2020  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# Global constants
#

package SlackPack::Constants;

use strict;
use warnings;

use File::Basename;
use parent qw(Exporter);

@SlackPack::Constants::EXPORT = qw(
  SP_NAME
  SP_VERSION
  SP_RELEASE_DATE
  SP_HOME_URL
  SP_AUTHOR
  SP_AUTHOR_EMAIL
  SP_AUTHOR_URL
  SP_COPYRIGHT
  SP_LOCAL_ROOT
  SP_LIBPATH
  SP_CONF
);

# Change these to your preference
use constant SP_NAME         => 'SlackPack';
use constant SP_VERSION      => '0.5.1';
use constant SP_RELEASE_DATE => '2020-04-09';
use constant SP_HOME_URL     => 'https://sotirov-bg.net/slackpack';
use constant SP_AUTHOR       => 'Georgi D. Sotirov';
use constant SP_AUTHOR_EMAIL => 'gdsotirov@gmail.com';
use constant SP_AUTHOR_URL   => 'https://sotirov-bg.net/~gsotirov/';
use constant SP_COPYRIGHT    => 'Copyright (c) 2005-2020 Georgi D. Sotirov';
use constant SP_LOCAL_ROOT   => '/var/ftp/pub/contrib/slackware/packages/';
use constant SP_LIBPATH      => dirname(dirname(__FILE__));
use constant SP_CONF         => SP_LIBPATH . "/slackpack.pl.inc";

1;

