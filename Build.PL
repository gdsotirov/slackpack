#!/usr/bin/perl

# SlackPack
# Copyright (C) 2006-2020  Georgi D. Sotirov, gdsotirov@gmail.com
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
# Module build script using Module::Build for testing

use strict;
use warnings;

use FindBin qw($RealBin);
use lib ($RealBin);

use Module::Build;
use SlackPack::Constants qw(SP_NAME SP_VERSION SP_AUTHOR);

my $build = Module::Build->new
(
  module_name        => SP_NAME,
  dist_abstract      => 'SlackPack - Slackware packages',
  dist_version       => SP_VERSION,
  dist_author        => SP_AUTHOR,
  license            => 'gpl',
  requires           => {'perl'                 => '>= 5.8.0',
                         'CGI'                  => '3.51',
                         'DBI'                  => '1.54',
                         'Date::Parse'          => '1.17',
                         'Exporter'             => '5.61',
                         'File::Basename'       => '2.85',
                         'HTML::Entities'       => '3.56',
                         'HTML::TreeBuilder'    => '3.23',
                         'HTTP::Cookies'        => '6.00',
                         'HTTP::Date'           => '6.00',
                         'HTTP::Headers::Util'  => '6.00',
                         'I18N::AcceptLanguage' => '1.04',
                         'LWP::UserAgent'       => '5.825',
                         'MIME::Base64'         => '3.07',
                         'POSIX'                => 0,
                         'Template'             => '2.24',
                        },
  create_readme      => 0,
  create_makefile_pl => 0
);

$build->create_build_script;

