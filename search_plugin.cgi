#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2009  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# This script generates quick search description for the site
#
# $Id: search_plugin.cgi,v 1.3 2017/01/07 10:56:04 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Template;
use SlackPack::Error;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

print $cgi->header('application/xml', charset => 'utf-8');
$template->process("search/search_plugin.xml.tmpl")
  || ThrowTemplateError($template->error);

