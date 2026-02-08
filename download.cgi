#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2026  Georgi D. Sotirov, gdsotirov@gmail.com
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

use strict;
use File::Basename;
use lib dirname (__FILE__);
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
  $vars->{'pack_rel_url'} = $pack->get_rel_url;
  $vars->{'mirrors'} = SlackPack::Mirror->get_all;

  print $cgi->header();
  $template->process("pack/download.html.tmpl", $vars) || ThrowTemplateError($template->error);
}
elsif ( $pack->{error} eq 'NotFound' ) {
  $vars->{'id'} = $id;
  $vars->{source} = $0;
  ThrowUserError("package_not_found", $vars);
}
else {
  $vars->{'id'} = $id;
  $vars->{source} = $0;
  ThrowUserError("invalid_identifier", $vars);
}

