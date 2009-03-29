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
# This script manages package downloads
#
# $Id: download.cgi,v 1.3 2009/03/29 13:40:21 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Package;
use SlackPack::Mirror;
use SlackPack::Error;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $id = $cgi->param('id');
my $vars = {};

my $pack = new SlackPack::Package($id);

if ( $pack && ! defined $pack->{'error'} ) { 
  $vars->{'pack'} = $pack;
  $vars->{'mirrors'} = SlackPack::Mirror->get_all;

  print $cgi->header();
  $template->process("download.html.tmpl", $vars) || ThrowTemplateError($template->error);
}
elsif ( $pack->{error} eq 'NotFound' ) {
  $vars->{'id'} = $id;
  ThrowUserError("package_not_found", $vars);
}
else {
  $vars->{'id'} = $id;
  ThrowUserError("invalid_identifier", $vars);
}

