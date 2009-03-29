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
# This is representation of a site user
#
# $Id: User.pm,v 1.4 2009/03/29 12:51:34 gsotirov Exp $
#

package SlackPack::User;

use strict;
use SlackPack;
use Date::Parse;

use base qw(SlackPack::Object);

use constant ID_STR_FIELD=> 'pkgsid';
use constant DB_TABLE => 'users';
use constant REQUIRED_FIELDS => qw(name firstname email password);

sub DB_COLUMNS {
  return qw(
    id
    name
    firstname
    nick
    pkgsid
    email
    password
    registered
    packages
    lp_user),
    "AES_DECRYPT(lp_pass, 'taTul') AS lp_pass";
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $id = shift;

  unshift @_, $id;
  my $self = $class->SUPER::new(@_);
  $self->{registered} = str2time($self->{registered});

  return $self;
}

1;


__END__

=head1 NAME

SlackPack::User - A general representation of a site user

=head1 SYNOPSIS

my $user = new SlackPack::User(1);
my $user = new SlackPack::User('gds');

print "User name = " . $user->{name};
$user->get_all;

=head1 DESCRIPTION

This is a class, which represents a site user. It incorprorates all the data
for the user and provides general functionality.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the users is 'users'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a user object from
              the database by its identifier.

 Params:      $id - Identifier of the user in the database or user's
                    packages identity

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined users in the database.

 Returns:     List of fully initialized user objects.

=back

=head2 Database manipulation

=over

=item C<add>

 Description:

 Returns:

=item C<edit>

 Description:

 Returns:

=item C<remove>

 Description:

 Returns:

=back

