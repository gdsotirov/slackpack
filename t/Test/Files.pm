# SlackPack
# Copyright (C) 2006-2019  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# Identify Perl sources

package Test::Files;

use strict;
use warnings;

use File::Find;

our @sources = ();
our @templates = ();

# Find all *.pm and *.cgi Perl sources
sub find_sources {
  if ( $_ =~ /\.pm$/ || $_ =~ /\.cgi$/ ) {
    push(@sources, $File::Find::name)
  }
}

# Fine all templates (i.e. *.tmpl files)
sub find_templates {
  push(@templates, $File::Find::name) if $_ =~ /\.tmpl$/;
}

find(\&find_sources  , qw(. SlackPack));
find(\&find_templates, qw(template));

1;

