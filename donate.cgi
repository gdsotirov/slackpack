#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2007  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# $Id: donate.cgi,v 1.1.2.1 2007/03/31 20:37:15 gsotirov Exp $
#

use strict;
use SlackPack;
use Digest::MD5 qw(md5);

my $cgi = SlackPack->cgi;
my $template = SlackPack->template;

my $query = $cgi->param('q');
# MoneyBookers status report
my $mb_secword = 'unknown';
my $mb_to      = $cgi->param('pay_to_email')      || '';
my $mb_from    = $cgi->param('pay_from_email')    || '';
my $mb_mid     = $cgi->param('merchant_id')       || '';
my $mb_tid     = $cgi->param('mb_transaction_id') || '';
my $mb_amnt    = $cgi->param('mb_amount')         || '';
my $orig_amnt  = $cgi->param('amount')            || '';
my $mb_crncy   = $cgi->param('mb_currency')       || '';
my $orig_crncy = $cgi->param('currency')          || '';
my $mb_stat    = $cgi->param('status')            || '';
my $mb_md5     = $cgi->param('md5sig')            || '';
# MoneyBookers custom field - donator's message
my $mb_msg     = $cgi->param('dntr_msg')          || '';

my $vars = {};

# Process status messages from MoneyBookers
if ( $mb_mid && $mb_tid && $mb_amnt && $mb_crncy && $mb_stat ) {
  my $vdata = $mb_mid || $mb_tid || $mb_secword || $mb_amnt || $mb_crncy ||
              $mb_stat;
  if ( md5($vdata) eq $mb_md5 ) {
    # TODO: Insert record into the 'donations' table
    if ( $mb_stat = 2 || $mb_stat = 1 || $mb_stat = 0 ) {
      $vars->{'thankyou'} = 1;
      $vars->{'through'} = 'moneybookers';
    }
    else {
      $vars->{'regards'} = 1;
    }
  }
}
else {
  # TODO: Write received data to a log file
}

print $cgi->header();
$template->process("donate.html.tmpl", $vars) || ThrowTemplateError($template->error);
