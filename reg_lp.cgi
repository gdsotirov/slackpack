#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2009  Georgi D. Sotirov, gsotirov@sotirov-bg.net
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
# This module provides easy registration in linuxpackages.net. It retrieves
# the package upload page using package's author credentials and fills
# the form fields with values.
#
# $Id: reg_lp.cgi,v 1.4 2009/05/31 11:24:52 gsotirov Exp $
#

use strict;

use SlackPack;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use SlackPack::HTTP::Cookies;
use HTML::TreeBuilder;
use SlackPack::Package;
use SlackPack::User;
use SlackPack::Mirror;
use SlackPack::Error;

use constant AUTH_URL   => 'http://www.linuxpackages.net/auth_user.php';
use constant UPLD_URL   => 'http://www.linuxpackages.net/upload-2.php';
use constant MYUPLD_URL => 'reg_lp.cgi?action=post';
# Session IDs cookie names
use constant LP_SESSID  => 'PHPSESSID';
use constant MY_SESSID  => 'LP_SESSID';

my $cgi = SlackPack->cgi;
my $id = $cgi->param('id');
my $action = $cgi->param('action');

my $vars = {};

if ( defined $action && $action eq 'post' ) {
  my $ua = LWP::UserAgent->new;
  my $cookie_jar = SlackPack::HTTP::Cookies->new;

  $ua->timeout(10);
  $ua->env_proxy;
  $ua->cookie_jar($cookie_jar);

  $cookie_jar->set_cookie("", LP_SESSID, $cgi->cookie(MY_SESSID), "/", "", "", true, true, 60, false, "");

  # Post form to the upload URL
  $ua->default_header('Content-Type' => "multipart/form-data");

  my $lp_resp = $ua->post(UPLD_URL,
                          {pkg_name    => $cgi->param('pkg_name'),
                           pkg_ver     => $cgi->param('pkg_ver'),
                           lic         => $cgi->param('lic'),
                           di_ver      => $cgi->param('di_ver'),
                           sl_ver      => $cgi->param('sl_ver'),
                           pkg_arch    => $cgi->param('pkg_arch'),
                           pkg_cat     => $cgi->param('pkg_cat'),
                           pkg_sub     => $cgi->param('pkg_sub'),
                           pkg_desc    => $cgi->param('pkg_desc'),
                           httpdl      => $cgi->param('httpdl'),
                           home        => $cgi->param('home'),
                           pkg_size    => $cgi->param('pkg_size'),
                           filename    => $cgi->param('filename'),
                           md5sum      => $cgi->param('md5sum'),
                           buildscript => $cgi->param('buildscript'),
                           pgpsign     => $cgi->param('pgpsign'),
                           pgp_asc     => $cgi->param('pgp_asc'),
                           hostme      => $cgi->param('hostme'),
                           upgrade     => $cgi->param('upgrade')
                          });

  if ( $lp_resp->is_error ) {
    $vars->{url} = AUTH_URL;
    $vars->{errcode} = $lp_resp->is_error;
    $vars->{source} = $0;
    $vars->{level} = 'sys';
    ThrowCodeError("not_accesible", $vars);
  }

  $cgi->header();
  print $lp_resp->content;
}
else 
if ( defined $id ) {
  my $pack = new SlackPack::Package($id);

  if ( $pack && ! defined $pack->{'error'} ) {
    if ( defined $pack->{author}{lp_user} &&
         defined $pack->{author}{lp_pass} )
    {
      my $ua = LWP::UserAgent->new;
      my $cookie_jar = SlackPack::HTTP::Cookies->new;

      $ua->timeout(10);
      $ua->env_proxy;
      $ua->cookie_jar($cookie_jar);

      # First, authenticate to LP with the author credentials
      $ua->default_header('Content-Type' => "multipart/form-data");
      my $lp_resp = $ua->post(AUTH_URL,
                              {userid       => $pack->{author}{lp_user},
                               userpassword => $pack->{author}{lp_pass}});

      if ( $lp_resp->is_error ) {
        $vars->{url} = AUTH_URL;
        $vars->{errcode} = $lp_resp->is_error;
        $vars->{source} = $0;
        $vars->{level} = 'sys';
        ThrowCodeError("not_accesible", $vars);
      }

      # Then, get the package upload page
      $lp_resp = $ua->get(UPLD_URL);

      if ( $lp_resp->is_error ) {
        $vars->{url} = UPLD_URL;
        $vars->{errcode} = $lp_resp->is_error;
        $vars->{source} = $0;
        $vars->{level} = 'sys';
        ThrowCodeError("not_accesible", $vars);
      }

      # Structurize the retunred HTML document
      my $html_doc = HTML::TreeBuilder->new_from_content($lp_resp->content);

      # Rewrite form action
      my $form = $html_doc->look_down(sub { ($_[0]->tag eq 'form') && ($_[0]->attr('action') eq "/upload-2.php") });
      if ( defined ($form) ) {
        $form->attr('action', MYUPLD_URL);
      }

      # Fill up the form fields
      $html_doc->find_by_attribute('name', 'pkg_name')->attr('value', $pack->{title});
      $html_doc->find_by_attribute('name', 'pkg_ver' )->attr('value', $pack->{version});
      $html_doc->find_by_attribute('name', 'lic'     )->attr('value', $pack->{license}{name});

      # Distribution is fixed for now
      my $di_ver = $html_doc->find_by_attribute('name', 'di_ver');
      if ( defined (my $distro = $di_ver->look_down('value', 'SW')) ) {
        $distro->attr('selected', 'selected');
      }

      my $sl_ver = $html_doc->find_by_attribute('name', 'sl_ver');
      if ( defined (my $slack_ver = $sl_ver->look_down('value', $pack->{slackver}{str})) ) {
        $slack_ver->attr('selected', 'selected');
      }

      my $pkg_arch = $html_doc->find_by_attribute('name', 'pkg_arch');
      if ( defined (my $arch = $pkg_arch->look_down(sub { $_[0]->{'_content'}[0] eq $pack->{arch}{id} })) ) {
        $arch->attr('selected', 'selected');
      }

      my $pkg_cat = $html_doc->find_by_attribute('name', 'pkg_cat');
      if ( defined (my $category = $pkg_cat->look_down(sub { $_[0]->{'_content'}[0] eq $pack->{category}{name} })) ) {
        $category->attr('selected', 'selected');
      }

      $html_doc->find_by_attribute('name', 'pkg_desc')->push_content($pack->{description});
      $html_doc->find_by_attribute('name', 'httpdl'  )->attr('value', $pack->get_prime_url);
      $html_doc->find_by_attribute('name', 'home'    )->attr('value', $pack->{url});
      $html_doc->find_by_attribute('name', 'pkg_size')->attr('value', $pack->{filesize});
      $html_doc->find_by_attribute('name', 'filename')->attr('value', $pack->{filename});
      $html_doc->find_by_attribute('name', 'md5sum'  )->attr('value', $pack->{filemd5});

      if ( $pack->{slackbuild} eq "yes" ) {
        $html_doc->find_by_attribute('name', 'buildscript')->attr('checked', 'checked');
      }

      if ( defined $pack->{filesign} ) {
        $html_doc->find_by_attribute('name', 'pgpsign')->attr('checked', 'checked');
      }

      $html_doc->find_by_attribute('name', 'pgp_asc' )->push_content($pack->{filesign});
      $html_doc->find_by_attribute('name', 'hostme'  )->attr('checked', 'checked');

      # Output the modified document and set received cookies
      $ua->cookie_jar->{LP_SESSID}; # TODO: extract PHPSESSID cookie
      my $mycookie = $cgi->cookie(-name=>  MY_SESSID,
                                  -value=> '???');
      print $cgi->header(-cookie => $mycookie);
      print $html_doc->as_HTML;

      $html_doc->delete;
    }
    else
    {
      $vars->{author} = $pack->{author}{firstname}." ".$pack->{author}{name};
      ThrowUserError("not_a_lp_user", $vars);
    }
  }
  elsif ( $pack->{error} eq 'NotFound' ) {
    $vars->{'id'} = $id;
    ThrowUserError("package_not_found", $vars);
  }
  else {
    $vars->{'id'} = $id;
    ThrowUserError("invalid_identifier", $vars);
  }
}


1;


__END__

