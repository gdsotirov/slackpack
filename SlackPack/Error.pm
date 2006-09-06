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
# Slackpack error management module
#
# $Id: Error.pm,v 1.1 2006/09/06 18:24:59 gsotirov Exp $
#

package SlackPack::Error;

use strict;
use base qw(Exporter);
use SlackPack;

@SlackPack::Error::EXPORT = qw(ThrowCodeError ThrowUserError ThrowTemplateError);

sub throw_error {
  my ($name, $error, $vars) = @_;

  $vars->{'error'} = $error;

  my $template = SlackPack->template;

  print SlackPack->cgi->header();
  $template->process($name, $vars) || ThrowTemplateError($template->error());
}

sub ThrowUserError {
  throw_error("global/error-user.html.tmpl", @_);
}

sub ThrowCodeError {
  throw_error("global/error-code.html.tmpl", @_);
}

sub ThrowTemplateError {
  my ($template_error) = @_;

  my $template = SlackPack->template;

  my $vars = {};
  $vars->{'error_msg'} = $template_error;
  $vars->{'error'} = "template_error";

  if (!$template->process("global/code-error.html.tmpl", $vars)) {
    print <<END;
    <p class="error">The site has suffered an internal error. Please, save
    this page and send it to gdsotirov\@dir.bg with details of what you were
    doing at the time this message appeared.<br />
    The Template framework returned: <code>$template_error</code></p>
END
  }
}

1;

