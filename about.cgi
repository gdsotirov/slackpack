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
# This script generates date about the site
#
# $Id: about.cgi,v 1.6 2009/03/29 13:40:21 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::About;
use SlackPack::Template;
use SlackPack::Mirror;
use SlackPack::Error;

use HTML::Entities;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $query = $cgi->param('q');

my $vars = {};

if ( $query eq "repo" ) {
  $vars->{'mirrors'} = SlackPack::Mirror->get_all();
  $vars->{'formats'} = SlackPack::Slackver->get_all();

  print $cgi->header();
  $template->process("about/repository.html.tmpl", $vars) || ThrowTemplateError($template->error);
}
else { # $query eq "site"
  $vars->{'percent_sb'} = SlackPack::About::get_percent_sb;
  $vars->{'percent_cur'} = SlackPack::About::get_percent_cur;
  $vars->{'percent_binrel'} = SlackPack::About::get_percent_binrel;
  $vars->{'dstrbtn_by_arch'} = SlackPack::About::get_dstrbtn_by_arch;

  print $cgi->header();
  $template->process("about/site.html.tmpl", $vars) || ThrowTemplateError($template->error);
}
