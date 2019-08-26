#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2019  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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

use strict;
use SlackPack;
use SlackPack::Package;
use SlackPack::Error;
use HTML::Entities;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $id = $cgi->param('id');
my $dump = $cgi->param('dump') || 0;
my $md5 = $cgi->param('md5') || "";
my $verifymd5 = $cgi->param('verifymd5') || 0;
my $sign = $cgi->param('sign') || 0;
my $warn = $cgi->param('w') || 0;

my $vars = {};

my $pack = new SlackPack::Package($id);
if ( $pack && ! defined $pack->{'error'} ) {
  $vars->{'pack'} = $pack;
  if ( $dump eq "true" || $dump == 1 ) {  # Contents dump
    $vars->{'dump'} = $pack->list_contents;
    print $cgi->header();
    $template->process("pack/contents.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  elsif ( $md5 || $verifymd5 ) {          # MD5 verification
    $vars->{'checked'} = 0;
    if ( $md5 ne "" ) {
      $vars->{'checked'} = 1;
      $vars->{'correct'} = $pack->verify_md5($md5);
      $vars->{'md5'} = $md5;
    }
    print $cgi->header();
    $template->process("pack/verifymd5.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  elsif ( $sign ) {
    print $cgi->header();
    $template->process("pack/sign.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    $vars->{'warn'} = $warn;
    $vars->{'history'} = $pack->get_history;
    $vars->{'formats'} = $pack->get_formats;
    $vars->{'repo'} = SlackPack::Mirror->get_prime();
    print $cgi->header();
    $template->process("package.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}
elsif ( $pack->{error} eq 'NotFound' ) {
  $vars->{'id'} = $id;
  $vars->{'source'} = $0;
  ThrowUserError("package_not_found", $vars);
}
elsif ( $pack->{error} eq 'NoId' ) {
  $vars->{'source'} = $0;
  ThrowUserError("no_identifier", $vars);
}
else {
  $vars->{'id'} = $id;
  $vars->{'source'} = $0;
  ThrowUserError("invalid_identifier", $vars);
}

