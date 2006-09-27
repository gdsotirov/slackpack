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
# Ths script is responsible for generating site feeds
#
# $Id: feed.cgi,v 1.2 2006/09/27 20:12:44 gsotirov Exp $
#

use strict;
use HTML::Entities;
use SlackPack;
use SlackPack::Package;
use SlackPack::Category;
use SlackPack::News;
use SlackPack::Error;

my $pack = new SlackPack::Package;
my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

sub output_feed {
  my ($tmpl, $vars, $type) = @_;

  if ( $type eq 'atom' ) {
    $template->process($tmpl.".atom.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    $template->process($tmpl.".rss.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}

my $vars;

my $query = $cgi->param('q');
my $type = $cgi->param('type');

if ( $type eq 'atom' ) {
  print $cgi->header('application/xml');
}
else {
  print $cgi->header('application/xml');
}

if ( $query eq 'latest' ) {
  $vars->{'items'} = $pack->get_latest;

  output_feed("feed/latest", $vars, $type);
  exit;
}

if ( $query eq 'cat' ) {
  my $cat = $cgi->param('cat', 1);
  $vars->{'items'} = $pack->get_by_category($cat, 20);
  $vars->{'category'} = SlackPack::Category->get($cat);
  $vars->{'category'}{'id'} = $cat;

  output_feed("feed/category", $vars, $type);
  exit;
}

$vars->{'items'} = SlackPack::News->get_latest;
output_feed("feed/news", $vars, $type);
