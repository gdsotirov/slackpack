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
# SlackPack utilities
#
# $Id: Util.pm,v 1.1 2006/09/28 21:57:14 gsotirov Exp $
#

package SlackPack::Util;

use strict;
use SlackPack;

sub xml_quote {
  my ($var) = (@_);
  $var =~ s/\&/\&amp;/g;
  $var =~ s/</\&lt;/g;
  $var =~ s/>/\&gt;/g;
  $var =~ s/\"/\&quot;/g;
  $var =~ s/\'/\&apos;/g;
  return $var;
}

1;

