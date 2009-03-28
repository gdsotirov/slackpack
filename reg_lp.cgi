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
# This module provides registration in linuxpackages.net
#
# $Id: reg_lp.cgi,v 1.1 2009/03/28 00:44:01 gsotirov Exp $
#

use strict;

require File::Temp;
use File::Temp ();
use File::Temp qw/ :seekable /;
use HTML::TreeBuilder;

use SlackPack;
use SlackPack::Package;
use SlackPack::User;
use SlackPack::Error;

use constant AUTH_URL => 'http://www.linuxpackages.net/auth_user.php';
use constant UPLOAD_URL => 'http://www.linuxpackages.net/upload-2.php';

my $cgi = SlackPack->cgi;
my $id = $cgi->param('id');

print $cgi->header();

my $pack = new SlackPack::Package($id);
my $vars = {};

if ( $pack && ! defined $pack->{'error'} ) {
  if ( defined $pack->{author}{lp_user} &&
       defined $pack->{author}{lp_pass} )
  {
    my $cookie_fh = File::Temp->new();

    my $auth_cmd  = "curl --form userid=".$pack->{author}{lp_user};
       $auth_cmd .= "     --form userpassword=".$pack->{author}{lp_pass};
       $auth_cmd .= "     --cookie-jar ".$cookie_fh->filename." ".AUTH_URL;

    system $auth_cmd || die 1;

    my $html_fh = File::Temp->new();
    my $upld_cmd  = "curl --silent";
       $upld_cmd .= "     --cookie ".$cookie_fh->filename;
       $upld_cmd .= "     --output ".$html_fh->filename." ".UPLOAD_URL;

    system $upld_cmd || die 2;

    my $html_doc = HTML::TreeBuilder->new();
    $html_doc->parse_file($html_fh->filename);

    $html_doc->find_by_attribute('name', 'pkg_name')->attr('value', $pack->{title});
    $html_doc->find_by_attribute('name', 'pkg_ver' )->attr('value', $pack->{version});
    $html_doc->find_by_attribute('name', 'lic'     )->attr('value', $pack->{license}{name});
    #di_ver => 'SW',
    #sl_ver => slackver,
    #pkg_arch => arch,
    #pkg_cat => category,
    $html_doc->find_by_attribute('name', 'pkg_desc')->push_content($pack->{description});
    #httpdl => ?,
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

    print $html_doc->as_HTML;

    $html_doc->delete;
  }
  else
  {
    ThrowUserError("not_an_lp_user", $vars);
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

