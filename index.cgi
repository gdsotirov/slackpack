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
# Ths script manages anonymous users as well as logon of registered ones
#
# $Id: index.cgi,v 1.2 2006/07/08 22:28:40 gsotirov Exp $
#

use strict;
use CGI;
use SlackPack;
use SlackPack::Package;

my $pack = new SlackPack::Package;
my $cgi = new CGI;
my $template = SlackPack->template;

my $vars = {};
$vars->{'packs'} = $pack->get_latest;
$template->process("index.html.tmpl", $vars) || die $template->error;
print $cgi->header();

