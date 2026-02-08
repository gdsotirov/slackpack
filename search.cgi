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
# Ths script is responsible for managing all kind of package searches
#

use strict;
use File::Basename;
use lib dirname (__FILE__);
use SlackPack;
use SlackPack::Arch;
use SlackPack::Category;
use SlackPack::Package;
use SlackPack::Slackver;
use SlackPack::Vendor;
use SlackPack::Error;

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $vars;
my $params;

my $name    = $cgi->param('name')   || $cgi->param('q');
my $ver     = $cgi->param('ver')    || $cgi->param('version');
my $arch    = $cgi->param('arch')   || $cgi->param('architecture');
my $cat     = $cgi->param('cat')    || $cgi->param('category');
my $slack   = $cgi->param('slack')  || $cgi->param('slackver');
my $vendor  = $cgi->param('ven')    || $cgi->param('vendor');
my $laton   = $cgi->param('lo')     || $cgi->param('latestonly');
my $gplon   = $cgi->param('gpl')    || $cgi->param('gplonly');
my $sbld    = $cgi->param('sb')     || $cgi->param('slackbuild');
my $nobin   = $cgi->param('nobin');
my $incntnts= $cgi->param('incntnts');

$params->{name}       = $name   if $name;
$params->{version}    = $ver    if $ver;
$params->{arch}       = $arch   if $arch ne "any";
$params->{category}   = $cat    if $cat;
$params->{slackver}   = $slack  if $slack ne "any";
$params->{vendor}     = $vendor if $vendor ne "any";
$params->{latestonly} = 'yes'   if $laton;
$params->{gplonly}    = 'yes'   if $gplon;
$params->{slackbuild} = 'yes'   if $sbld;
$params->{nobin}      = 'yes'   if $nobin;
$params->{incontents} = 'yes'   if $incntnts;

sub register_query {
  my ($terms, $count) = @_;
  my $dbh = SlackPack->dbh;

  my $query  = "INSERT INTO searches\n";
     $query .= "  (query, results";
     $query .= ", arch"                  if $params->{arch};
     $query .= ", slackver"              if $params->{slackver};
     $query .= ", f_latestonly"          if $params->{latestonly} eq 'yes';
     $query .= ", f_gplonly"             if $params->{gplonly}    eq 'yes';
     $query .= ", f_sponly "             if $params->{slackbuild} eq 'yes';
     $query .= ", f_nobin"               if $params->{nobin}      eq 'yes';
     $query .= ")\n";
     $query .= "VALUES\n";
     $query .= "  (".$dbh->quote($terms).", $count";
     $query .= ", ".$dbh->quote($params->{arch}) if $params->{arch};
     $query .= ", ".$dbh->quote($params->{slackver}) if $params->{slackver};
     $query .= ", 'y'"                   if $params->{latestonly} eq 'yes';
     $query .= ", 'y'"                   if $params->{gplonly}    eq 'yes';
     $query .= ", 'y'"                   if $params->{slackbuild} eq 'yes';
     $query .= ", 'y'"                   if $params->{nobin}      eq 'yes';
     $query .= ")";

  $dbh->do($query);
}

# Architecture only search
if ( $arch && !$cat && !$name && !$slack && !$vendor ) {
  $vars->{'search'} = 'arch';
  $vars->{'arch'} = new SlackPack::Arch($arch);
  $params->{'latestonly'} = "yes";
}

# Category only search
if ( $cat && !$arch && !$name && !$slack && !$vendor) {
  $vars->{'search'} = 'cat';
  $vars->{'category'} = new SlackPack::Category($cat);
  $params->{'latestonly'} = "yes";
}

# Slackware version only search
if ( $slack && !$arch && !$cat && !$name && !$vendor ) {
  $vars->{'search'} = 'slack';
  $vars->{'slackver'} = new SlackPack::Slackver($slack);
  $params->{'latestonly'} = "yes";
}

if ( $vendor && !$arch && !$cat && !$name && !$slack ) {
  $vars->{'search'} = 'ven';
  $vars->{'vendor'} = new SlackPack::Vendor($vendor);
  $params->{'latestonly'} = "yes";
}

# Make the serarch if a major criteria is given
if ( $arch || $cat || $name || $slack || $vendor ) {
  if ( $params->{incontents} eq "yes" ) {
    $vars->{'search'} = 'cntnts';
  }

  $vars->{'packs'}  = SlackPack::Package->search($params);
  $vars->{'rcount'} = scalar @{$vars->{'packs'}};
  $vars->{'query'}  = $name;
  $vars->{'query'}  =~ s/\"/\'/g;

  # Register only searches not triggered by links
  if ( defined $name )
  {
    register_query($vars->{'query'}, $vars->{'rcount'});
  }

  print $cgi->header();
  $template->process("search/results.html.tmpl", $vars)
    || ThrowTemplateError($template->error);

  exit;
}
elsif ( $cgi->param('submit') || $cgi->param('advsubmit') ) {
  ThrowUserError("no_search_terms", {source => $0});
  exit;
}

# Default behavior - show advanced search form
$vars->{'archs'} = SlackPack::Arch->get_all;
$vars->{'slackvers'} = SlackPack::Slackver->get_all;

print $cgi->header();
$template->process("search/advanced.html.tmpl", $vars)
  || ThrowTemplateError($template->error);

