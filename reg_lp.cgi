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
# $Id: reg_lp.cgi,v 1.3 2009/03/29 18:05:00 gsotirov Exp $
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
      $vars->{url} = AUTH_URL;
      ThrowCodeError("not_accesible", $vars);
    }

    # Then, get the package upload page
    $lp_resp = $ua->get(UPLD_URL);

    if ( $lp_resp->is_error ) {
      $vars->{url} = UPLD_URL;
      ThrowCodeError("not_accesible", $vars);
    }

    # Structurize the retunred HTML document
    my $html_doc = HTML::TreeBuilder->new_from_content($lp_resp->content);

    # Rewrite form action
    my $form = $html_doc->look_down(sub { ($_[0]->tag eq 'form') && ($_[0]->attr('action') eq "/upload-2.php") });
    if ( defined ($form) ) {
      $form->attr('action', UPLD_URL);
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

    # Output the modified document
    print $ua->cookie_jar->as_string; # TODO: Why doesn't work???
    print $cgi->header();
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


1;


__END__

