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
# Ths script is responsible for generating site feeds
#
# $Id: feed.cgi,v 1.7 2007/01/28 12:33:37 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::Category;
use SlackPack::Error;
use SlackPack::News;
use SlackPack::Package;
use SlackPack::Slackver;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

sub output_feed {
  my ($tmpl, $vars, $type) = @_;

  if ( $type eq 'rdf' ) {
    $template->process($tmpl.".rdf.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  elsif ( $type eq 'rss' ) {
    $template->process($tmpl.".rss.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    $template->process($tmpl.".atom.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}

print $cgi->header('application/xml');

my $vars;
$vars->{'lastbuild'} = time;
my $type = $cgi->param('type');

if ( my $cat = $cgi->param('cat') ) {
  $vars->{'category'} = new SlackPack::Category($cat);
  if ( !$vars->{'category'}{'error'} ) {
    $vars->{'items'} = SlackPack::Package->search({category => $cat}, 20);
    output_feed("feed/category", $vars, $type);
    exit;
  }
}
elsif ( my $slack = $cgi->param('slack') ) {
  $vars->{'slackver'} = new SlackPack::Slackver($slack);
  if ( !$vars->{'slackver'}{'error'} ) {
    $vars->{'items'} = SlackPack::Package->search({slackver => $slack}, 20);
    output_feed("feed/slack", $vars, $type);
    exit;
  }
}
elsif ( $cgi->param('q') eq 'news' ) {
  $vars->{'items'} = SlackPack::News->get_latest;
  output_feed("feed/news", $vars, $type);
  exit;
}

# Default - return latest packages in the site
$vars->{'items'} = SlackPack::Package->get_latest;
output_feed("feed/latest", $vars, $type);

