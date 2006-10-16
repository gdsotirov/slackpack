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
# $Id: pack.cgi,v 1.14 2006/10/16 22:05:24 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Package;
use SlackPack::Error;
use HTML::Entities;

my $cgi = SlackPack->cgi;
my $pack = new SlackPack::Package;
my $template = SlackPack->template;

my $id = $cgi->param('id');
my $dump = $cgi->param('dump') || 0;
my $vars = {};

sub reformat_description {
  my $text = encode_entities(@_[0]);
  $text =~ s/ {2,}/&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/\n+/<br \/>/gm;
  return $text;
}

if ( $id =~ /^[0-9]+$/ ) {
  if ( $dump eq "true" || $dump == 1 ) {
    $vars->{'pack'} = $pack->get($id);
    $vars->{'dump'} = $pack->list_contents($id);
    print $cgi->header();
    $template->process("pack/contents.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    $vars->{'pack'} = $pack->get($id);
    $vars->{'pack'}{'desc'} = reformat_description($vars->{'pack'}{'desc'});
    $vars->{'history'} = $pack->get_history($vars->{'pack'}->{'name'}, $id);
    print $cgi->header();
    $template->process("package.html.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}
else {
  $vars->{'id'} = $id;
  ThrowUserError("invalid_identifier", $vars);
}
