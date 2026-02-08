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
# Redefinition of HTTP::Cookies class
#

package SlackPack::HTTP::Cookies;

use strict;
use base qw/HTTP::Cookies/;
use HTTP::Date;
use HTTP::Headers::Util qw(join_header_words);


sub as_string
{
  my($self, $skip_discard) = @_;
  my @res;
  $self->scan(sub {
    my($version, $key, $val, $path, $domain, $port, $path_spec, $secure, $expires, $discard, $rest) = @_;
    my @h = ($key, $val);
    push(@h, "expires" => HTTP::Date::time2isoz($expires)) if $expires;
    push(@h, "domain" => $domain);
    push(@h, "path", $path);
    my $k;
    for $k (sort keys %$rest) {
      push(@h, $k, $rest->{$k});
    }
    push(@res, "Set-Cookie: " . join_header_words(\@h));
  });
  join("\n", @res, "");
}


1;

