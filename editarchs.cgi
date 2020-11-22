#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2020  Georgi D. Sotirov, gdsotirov@gmail.com
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
# This script manages the addition of a new slackware package to the repository
#

use strict;
use CGI;
use DBI;
use SlackPack;
use SlackPack::Arch;

my $cgi = new CGI;
my $arch = new SlackPack::Arch;
my $template = new SlackPack::Template;

my $action = $cgi->param('action');

if ( $action eq "" ) {
  my $vars = $arch->get_all;
  $template->process("admin/arch/list.html.tmpl", $vars) || die $template->error;
  exit;
}

if ( $action eq "add" ) {
  $template->process("admin/arch/create.html.tmpl") || die $template->error;

  exit;
}

if ( $action eq "new" ) {
  my $new_id = $cgi->parm('new_id');
  my $name = $cgi->param('name');
  my $def = $cgi->param('default');

  if ( get($name) ) {
    #ThrowError("arch_already_exists");
  }

  $arch->add({id => $new_id, name => $name, def => $def});

  exit;
}

if ( $action eq "edit" ) {
  my $vars = {};
  $template->process("admin/arch/edit.html.tmpl", $vars) || $template->error;

  exit;
}

if ( $action eq "update" ) {
  my $id = $cgi->param('new_id');
  my $name = $cgi->param('name');
  my $def = $cgi->param('default');

  $arch->edit({id => $id, name => $name, def => $def}, $id);

  exit;
}

if ( $action eq "del" ) {
  my $id = $cgi->param('id');

  $arch->remove($id);

  exit;
}

