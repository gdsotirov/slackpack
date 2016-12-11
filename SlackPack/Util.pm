#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2015  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# SlackPack utilities
#
# $Id: Util.pm,v 1.12 2016/12/11 15:47:59 gsotirov Exp $
#

package SlackPack::Util;

use strict;
use SlackPack;
use POSIX;
use HTML::Entities;
#use HTML::Email::Obfuscate;

sub xml_quote {
  my ($var) = (@_);

  # According to XML 1.1 specification (chapter 4.6 Predefined Entities)
  $var =~ s/\&/\&amp;/g;
  $var =~ s/</\&lt;/g;
  $var =~ s/>/\&gt;/g;
  $var =~ s/\"/\&quot;/g;
  $var =~ s/\'/\&apos;/g;

  # the following nukes characters disallowed by the XML 1.0
  # spec, Production 2.2. 1.0 declares that only the following
  # are valid:
  # (#x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF])
  $var =~ s/([\x{0001}-\x{0008}]|
             [\x{000B}-\x{000C}]|
             [\x{000E}-\x{001F}]|
             [\x{D800}-\x{DFFF}]|
             [\x{FFFE}-\x{FFFF}])//gx;

  return $var;
}

sub url_quote {
  my ($toencode) = (@_);
  $toencode =~ s/([^a-zA-Z0-9_\-.])/uc sprintf("%%%02x",ord($1))/eg;
  return $toencode;
}

sub format_desc_xml {
  my ($text) = (@_);
  $text =~ s/\n+/<br \/>/gm;
  $text =~ s/ {5}/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {4}/&nbsp;&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {3}/&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {2}/&nbsp;&nbsp;/gm;
  $text = encode_entities($text, "<>&'\"");
  return $text;
}

sub format_desc_html {
  my ($text) = (@_);
  $text = encode_entities($text, "<>&'\"");
  $text =~ s/ {5}/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {4}/&nbsp;&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {3}/&nbsp;&nbsp;&nbsp;/gm;
  $text =~ s/ {2}/&nbsp;&nbsp;/gm;
  $text =~ s/\n+/<br \/>/gm;
  return $text;
}

sub email_obfuscate {
  my ($address) = (@_);

  $address =~ s/@/&#64;/g;
  $address =~ s/\./&#46;/g;

  return $address;
}

sub rround {
  my ($num, $prec) = @_;
  $prec = 2 if !defined $prec;

  return POSIX::ceil($num * 10 ** $prec)/ 10 ** $prec if $prec > 1;
  return POSIX::ceil($num / $prec) * $prec;
}

sub format_bytes {
  my ($number, @sufs) = @_;

  my $suf = 0;
  while ( $number > 1024 ) {
    $number /= 1024;
    ++$suf;
  }

  return sprintf("%.2f %s", $number, $sufs[0][$suf]);
}

1;

__END__

=head1 NAME

SlackPack::Util - SlackPack utility routines

=head1 SYNOPSIS

  use SlackPack::Util;

  $rounded = rround(123.45678, 2); # 123.46
  $rounded = rround(123.45678);    # 123.46, precision assumed 2 decimal places

=head1 DESCRIPTION

This module is for all miscelaneous utility functions used in SlackPack

=head2 METHODS

=over 4

=item C<rround> NUMBER [, PRECISION]

Rounds the give real NUMBER to the given PRECISION. If PRECISION is not give
the value of 2 is assumed. PRECISION can be both integer or real number, so
PRECISION with value of 2 is same as PRECISION with value of 0.01

=item C<format_bytes> NUMBER, SUFFIXES

Convert bytes in human readable format. The suffixes in an array with strings
which should be added to the number to give it meaning.

=cut
