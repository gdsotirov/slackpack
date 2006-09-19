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
# Ths script is responsibel for managing all kind of package searches
#
# $Id: search.cgi,v 1.8 2006/09/19 18:17:04 gsotirov Exp $
#

use strict;
use HTML::Entities;
use SlackPack;
use SlackPack::Package;
use SlackPack::Category;
use SlackPack::Error;

my $pack = new SlackPack::Package;
my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $vars;

if ( my $cat = $cgi->param('cat') ) {
  $vars->{'by_cat'} = 1;
  $vars->{'packs'} = $pack->get_by_category($cat);
  $vars->{'rcount'} = scalar @{$vars->{'packs'}};
  $vars->{'query'} = SlackPack::Category->get($cat)->{'name'};

  print $cgi->header();
  # TODO: Improve error handling on this line
  $template->process("search/results.html.tmpl", $vars) || ThrowTemplateError($template->error);

  exit;
}

if ( my $query = $cgi->param('q') ) {
  my @terms = split(/\s+/, $query, 5);
  $vars->{'by_terms'} = 1;
  $vars->{'packs'} = $pack->get_by_name(@terms);
  $vars->{'rcount'} = scalar @{$vars->{'packs'}};
  $vars->{'query'} = encode_entities($query);

  print $cgi->header();
  # TODO: Improve error handling on this line
  $template->process("search/results.html.tmpl", $vars) || ThrowTemplateError($template->error);

  exit;
}

# Default behaviour
$vars->{'rcount'} = 0;
print $cgi->header();
# TODO: Improve error handling on this line
$template->process("search/results.html.tmpl", $vars) || ThrowTemplateError($template->error);
