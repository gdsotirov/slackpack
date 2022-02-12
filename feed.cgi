#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2022  Georgi D. Sotirov, gdsotirov@gmail.com
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

use strict;
use File::Basename;
use lib dirname (__FILE__);
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
    print $cgi->header('application/rdf+xml');
    $template->process($tmpl.".rdf.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  elsif ( $type eq 'rss' ) {
    print $cgi->header('application/rss+xml');
    $template->process($tmpl.".rss.tmpl", $vars) || ThrowTemplateError($template->error);
  }
  else {
    print $cgi->header('application/atom+xml');
    $template->process($tmpl.".atom.tmpl", $vars) || ThrowTemplateError($template->error);
  }
}

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
elsif ( my $vendor = $cgi->param('vendor') ) {
  $vars->{'vendor'} = new SlackPack::Vendor($vendor);
  if ( !$vars->{'vendor'}{'error'} ) {
    $vars->{'items'} = SlackPack::Package->search({vendor => $vendor}, 20);
    output_feed("feed/vendor", $vars, $type);
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
elsif ( $cgi->param('q') eq 'latest32' ) {
  $vars->{'items'} = SlackPack::Package->get_latest("32");
  $vars->{'query'} = 'latest32';
  $vars->{'arch'}  = 'x86';
  output_feed("feed/latest", $vars, $type);
  exit;
}
elsif ( $cgi->param('q') eq 'latest64' ) {
  $vars->{'items'} = SlackPack::Package->get_latest("64");
  $vars->{'query'} = 'latest64';
  $vars->{'arch'}  = 'x86_64';
  output_feed("feed/latest", $vars, $type);
  exit;
}

# Default - return latest packages in the site
$vars->{'items'} = SlackPack::Package->get_latest;
$vars->{'query'} = 'latest';
output_feed("feed/latest", $vars, $type);

