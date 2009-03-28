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
# $Id: reg_lp.cgi,v 1.2 2009/03/28 20:21:22 gsotirov Exp $
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

use constant AUTH_URL => 'http://linuxpackages.net/auth_user.php';
use constant UPLD_URL => 'http://linuxpackages.net/upload-2.php';

my $cgi = SlackPack->cgi;
my $id = $cgi->param('id');

my $pack = new SlackPack::Package($id);
my $vars = {};

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
      print $cgi->header();

      $vars->{id} = AUTH_URL;
      ThrowCodeError("not_accesible", $vars);
    }

    # Then, get the package upload page
    $lp_resp = $ua->get(UPLD_URL);

    if ( $lp_resp->is_error ) {
      print $cgi->header();

      $vars->{id} = UPLD_URL;
      ThrowCodeError("not_accesible", $vars);
    }

    # Structurize the retunred HTML document
    my $html_doc = HTML::TreeBuilder->new_from_content($lp_resp->content);

    # Fill up the form fields
    $html_doc->find_by_attribute('name', 'pkg_name')->attr('value', $pack->{title});
    $html_doc->find_by_attribute('name', 'pkg_ver' )->attr('value', $pack->{version});
    $html_doc->find_by_attribute('name', 'lic'     )->attr('value', $pack->{license}{name});
    #di_ver => 'SW',
    #sl_ver => slackver,
    #pkg_arch => arch,
    #pkg_cat => category,
    $html_doc->find_by_attribute('name', 'pkg_desc')->push_content($pack->{description});
    $html_doc->find_by_attribute('name', 'httpdl'  )->push_content($pack->get_prime_url);
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

    # Output the modified document
    print $ua->cookie_jar->as_string;
    print $cgi->header();
    print $html_doc->as_HTML;

    $html_doc->delete;
  }
  else
  {
    print $cgi->header();

    ThrowUserError("not_an_lp_user", $vars);
  }
}
elsif ( $pack->{error} eq 'NotFound' ) {
  print $cgi->header();

  $vars->{'id'} = $id;
  ThrowUserError("package_not_found", $vars);
}
else {
  print $cgi->header();

  $vars->{'id'} = $id;
  ThrowUserError("invalid_identifier", $vars);
}


1;


__END__

