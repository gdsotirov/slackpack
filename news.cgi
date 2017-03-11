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
# This script deals with site news presentation
#
# $Id: news.cgi,v 1.6 2017/03/11 10:02:36 gsotirov Exp $
#

use strict;
use SlackPack;
use SlackPack::News;
use SlackPack::Error;

use Date::Parse;

my $news = new SlackPack::News;
my $cgi = SlackPack->cgi;
my $template = SlackPack->template;
my $id    = $cgi->param('id');
my $month = $cgi->param('month') || $cgi->param('m') || 0;
my $year  = $cgi->param('year')  || $cgi->param('y') || 0;

my $vars = {};
if ( $year ) {
  if ( $month) {
    $vars->{'year'} = $year;
    $vars->{'month'} = $month;
    $vars->{'yearmonth'} = str2time("$year-$month-01");
    $vars->{'news'} = SlackPack::News->get_by_calendar($year, $month);
  }
  else {
    $vars->{'year'} = $year;
    $vars->{'news'} = SlackPack::News->get_by_calendar($year);
  }
}
elsif ( $id =~ /\d+/ ) {
  $vars->{'news'} = [SlackPack::News->new($id)];
}
else {
  $vars->{'news'} = SlackPack::News->get_latest;
}

$vars->{'latest'} = SlackPack::News->get_latest;
$vars->{'calendar'} = SlackPack::News->get_calendar;

print $cgi->header();
$template->process("news.html.tmpl", $vars) || ThrowTemplateError($template->error);

