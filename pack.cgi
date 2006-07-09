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
# This script displays package data
#
# $Id: pack.cgi,v 1.1 2006/07/09 15:23:39 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Package;

my $cgi = SlackPack->cgi;
my $pack = new SlackPack::Package;
my $template = SlackPack->template;

my $id = $cgi->param('id');

if ( $id ) {
  my $vars = {};
  $vars->{'pack'} = $pack->get($id);
  print $cgi->header();
  $template->process("package.html.tmpl", $vars) || die $template->error;
}
