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
# This script displays package data
#
# $Id: pack.cgi,v 1.18 2007/01/28 12:33:37 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Package;
use SlackPack::Error;
use HTML::Entities;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $id = $cgi->param('id');
my $dump = $cgi->param('dump') || 0;
my $vars = {};

my $pack = new SlackPack::Package($id);
if ( $pack && ! defined $pack->{'error'} ) {
  if ( $dump eq "true" || $dump == 1 ) {
    $vars->{'pack'} = $pack;
    $vars->{'dump'} = $pack->list_contents;
    print $cgi->header();
    $template->process("pack/contents.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    $vars->{'pack'} = $pack;
    $vars->{'history'} = $pack->get_history;
    $vars->{'formats'} = $pack->get_formats;
    print $cgi->header();
    $template->process("package.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}
elsif ( $pack->{error} eq 'NotFound' ) {
  $vars->{'id'} = $id;
  ThrowUserError("package_not_found", $vars);
}
else {
  $vars->{'id'} = $id;
  ThrowUserError("invalid_identifier", $vars);
}

