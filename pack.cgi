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
# $Id: pack.cgi,v 1.10 2006/09/07 19:30:49 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Package;
use SlackPack::Category;
use SlackPack::Error;

use HTML::Entities;

my $cgi = SlackPack->cgi;
my $pack = new SlackPack::Package;
my $template = SlackPack->template;

my $id = $cgi->param('id');
my $vars = {};

($vars->{'count'}, $vars->{'size'}, $vars->{'sizeB'}) = $pack->get_totals;
$vars->{'categories'} = SlackPack::Category->get_all;

if ( $id =~ /^[0-9]+$/ ) {
  $vars->{'pack'} = $pack->get($id);
  $vars->{'pack'}{'desc'} = encode_entities($vars->{'pack'}{'desc'});
  $vars->{'pack'}{'desc'} =~ s/\n+/<br \/>/gm;
  $vars->{'history'} = $pack->get_history($vars->{'pack'}->{'name'}, $id);
  print $cgi->header();
  $template->process("package.html.tmpl", $vars) || ThrowTemplateError($template->error);
}
else {
  $vars->{'id'} = $id;
  ThrowUserError("invalid_identifier", $vars);
}
