#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2023  Georgi D. Sotirov, gdsotirov@gmail.com
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
# This script is intended to manage donations
#

use strict;
use File::Basename;
use lib dirname (__FILE__);
use SlackPack;
use SlackPack::Error;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;
# Connect to the database, so that the template global variables are
# initialized properly
my $dbh = SlackPack->dbh;

my $query    = $cgi->param('q'); # paypal or epay
my $operator = $cgi->param('operator') || $cgi->param('oper') || 0;
my $status   = $cgi->param('status')   || $cgi->param('stat') || 0;

my $vars = {};

$vars->{'query'} = $query;
$vars->{'operator'} = $operator if $operator;
$vars->{'status'} = ($status eq 'ok') ? 'ok' : 'ko' if $status;

print $cgi->header();
$template->process("donate.html.tmpl", $vars) || ThrowTemplateError($template->error);
