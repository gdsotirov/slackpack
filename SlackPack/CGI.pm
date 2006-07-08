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
# This modules overrides default CGI, so it can be used easaly with SlackPack
#
# $Id: CGI.pm,v 1.2 2006/07/08 23:04:09 gsotirov Exp $
#

package SlackPack::CGI;

use strict;

use base qw/CGI/;

use constant CONTENT_TYPE => 'text/html';

sub new {
  my ($invocant, @args) = @_;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@args);

  return $self;
}

sub header {
  my $self = shift;

  return $self->SUPER::header(CONTENT_TYPE) || "";
}

1;

