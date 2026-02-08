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
# This script manages site templates
#

package SlackPack::Template;

use strict;
use File::Basename;
use I18N::AcceptLanguage;
use SlackPack;
use SlackPack::About;
use SlackPack::Package;
use SlackPack::Category;
use SlackPack::Slackver;
use SlackPack::Vendor;
use SlackPack::Link;
use SlackPack::Util;

use base qw/Template/;

use constant SLACKPACK_PATH => dirname(dirname($INC{'SlackPack/Template.pm'}));

my $pack = new SlackPack::Package;

# Returns the path to the templates based on the Accept-Language
# settings of the user and of the available languages
# If no Accept-Language is present it uses the defined default
# Templates may also be found in the extensions/ tree
sub getTemplateIncludePath {
  my $acceptor = I18N::AcceptLanguage->new();

  my $supportedLanguages = [( 'en', 'bg' )];
  my $language = $acceptor->accepts($ENV{HTTP_ACCEPT_LANGUAGE},
                                    $supportedLanguages) || 'en';

  return [SLACKPACK_PATH."/template/$language"];
}

sub create {
  my $class = shift;

  return $class->new({
    INCLUDE_PATH => [\&getTemplateIncludePath],
    FILTERS => {
      xml       => \&SlackPack::Util::xml_quote,
      desc_xml  => \&SlackPack::Util::format_desc_xml,
      desc_html => \&SlackPack::Util::format_desc_html,
      html      => sub {
                     return Template::Filters::html_filter(@_);
                   },
      url       => \&SlackPack::Util::url_quote,
      email     => \&SlackPack::Util::email_obfuscate,
      base64    => \&SlackPack::Util::base64_enc
    },
    PRE_CHOMP    => 1,
    TRIM         => 1
  });
}

sub process {
  my $class = shift;
  my ($file, $vars) = @_;

  $vars->{'skip_h1'} = 0;
  $vars->{'slackpack'}{'name'} = SlackPack->SP_NAME;
  $vars->{'slackpack'}{'version'} = SlackPack->SP_VERSION;
  $vars->{'slackpack'}{'release_date'} = SlackPack->SP_RELEASE_DATE;
  $vars->{'slackpack'}{'home_url'} = SlackPack->SP_HOME_URL;
  $vars->{'slackpack'}{'author'}{'name'} = SlackPack->SP_AUTHOR;
  $vars->{'slackpack'}{'author'}{'email'} = SlackPack->SP_AUTHOR_EMAIL;
  $vars->{'slackpack'}{'author'}{'url'} = SlackPack->SP_AUTHOR_URL;
  $vars->{'slackpack'}{'copyright'} = SlackPack->SP_COPYRIGHT;

  if ( SlackPack->has_db ) {
    ($vars->{'slackpack'}{'packs'}{'count'},
     $vars->{'slackpack'}{'packs'}{'dcount'},
     $vars->{'slackpack'}{'packs'}{'size'}) = SlackPack::About->get_totals;
    $vars->{'slackpack'}{'categories'}  = SlackPack::Category->get_all;
    $vars->{'slackpack'}{'slackvers'}   = SlackPack::Slackver->get_all;
    $vars->{'slackpack'}{'vendors'}     = SlackPack::Vendor->get_all;
    $vars->{'slackpack'}{'lb_links'}    = SlackPack::Link->get_active_by_type('leftbar');
    $vars->{'slackpack'}{'about_links'} = SlackPack::Link->get_active_by_type('about');
  }

  $vars->{'page_url'} = ($ENV{HTTPS} eq "on" || $ENV{HTTP_X_FORWARDED_PROTO} eq "https")?"https://".$ENV{SERVER_NAME}.$ENV{REQUEST_URI}:"http://".$ENV{SERVER_NAME}.$ENV{REQUEST_URI};

  return $class->SUPER::process($file, $vars);
}

1;

