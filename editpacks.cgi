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
# This script manages the addition of a new slackware package to the repository
#

use strict;
use File::Basename;
use lib dirname (__FILE__);
use CGI;
use DBI;
use Template;
use SlackPack;
use SlackPack::Arch;
use SlackPack::License;
use SlackPack::Package;
use SlackPack::Slackver;

my $cgi = new CGI;
my $template = new SlackPack::Template;
my $slackarch = new SlackPack::Arch;
my $license = new SlackPack::License;
my $package = new SlackPack::Package;
my $slackver = new SlackPack::Slackver;

my $action = $cgi->param('action');

if ( $action eq "" ) {
  my $vars = {};
  $template->process("admin/pack/list.html.tmpl", $vars) || die $template->error;

  exit;
}

if ( $action eq "add" ) {
  my $vars = {};
  $vars->{'archs'} = $slackarch->get_all;
  $vars->{'licenses'} = $license->get_all;
  $vars->{'slackvers'} = $slackver->get_all;

  $template->process("admin/pack/create.html.tmpl") || die $template->error;

  exit;
}

if ( $action eq "new" ) {
  # General data
  my $name = $cgi->param('name');
  my $version = $cgi->param('version');
  my $build = $cgi->param('build');
  my $lic = $cgi->param('license');
  # Target data
  my $arch = $cgi->param('arch');
  my $sver = $cgi->param('slackver');
  # Description data
  my $url = $cgi->param('url');
  my $desc = $cgi->param('desc');
  # File info data
  my $fname = $cgi->param('filename');
  my $fsize = $cgi->param('filesize');
  my $fmd5 = $cgi->param('filemd5');
  my $fsign = $cgi->param('filesign');
  my $fdate = $cgi->param('filedate');

  my $query  = "INSERT INTO `slackpack` ";
  $query .= "(`name`, `version`, `license`, `arch`, `slackver`, `filename`, `size`, `md5`, `author`";
  if ( $build ne "" ) {
    $query .= ", `build`";
  }
  if ( $desc ne "" ) {
    $query .= ", `desc`";
  }
  if ( $fsign ne "" ) {
    $query .= ", `sign`";
  }
  if ( $fdate ne "" ) {
    $query .= ", `filedate`";
  }
  $query .= ") ";
  $query .= "VALUES ('$name', '$version', '$lic', '$arch', '$sver', '$fname', '$fsize', '$fmd5', 1";
  if ( $build ne "" ) {
    $query .= ", '$build'";
  }
  if ( $desc ne "" ) {
    $query .= ", '$desc'";
  }
  if ( $fsign ne "" ) {
    $query .= ", '$fsign'";
  }
  if ( $fdate ne "" ) {
    $query .= ", '$fdate'";
  }
  $query .= ")";

  exit;
}

if ( $action eq "edit" ) {
  my $id = $cgi->param('id');
  my $pack = $package->get($id);
  if ( $pack ) {
    my $vars = {};
    $vars->{'licenses'} = $license->get_all;
    $vars->{'archs'} = $slackarch->get_all;
    $vars->{'slackvers'} = $slackver->get_all;
    # TODO: Add package variables to the variables hash

    $template->process("admin/pack/edit.html.tmpl", $vars) || die $template->error();
  }
  else {
    ThrowError("no_such_package");
  }

  exit;
}

if ( $action eq "update" ) {
  exit;
}

if ( $action eq "delete" ) {
  exit;
}

