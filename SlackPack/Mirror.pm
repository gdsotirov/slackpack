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
# This class provides support for site mirrors
#
# $Id: Mirror.pm,v 1.1 2007/02/03 16:22:44 gsotirov Exp $
#

package SlackPack::Mirror;

use strict;
use SlackPack;
use MIME::Base64;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'mirrors';
use constant ORDER_FIELD => 'id';
use constant REQUIRED_FIELDS => qw(name protocol rel_url loc_country loc_continent);

sub DB_COLUMNS {
  return qw(id
            name
            protocol
            home_url
            rel_url
            loc_city
            loc_country
            loc_continent
            conn_info
            logo);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  if ( $self->{logo} ) {
    $self->{logo} = encode_base64($self->{logo});
  }

  return $self;
}

# Management routines
sub add {
}

sub edit {
}

sub remove {

}

1;


__END__

=head1 NAME

SlackPack::Mirror - Class that implements mirror support

=head1 SYNOPSIS

my $mirror = new SlackPack::Mirror(1);

print "Mirror " . $arch->{name} . " supports " . $arch->{protocol} . " protocol.";
$mirror->get_all;

=head1 DESCRIPTION

This is a class which provides support for site mirrors. It incorprorates
all the data for the mirror and provides method for listing all
site mirrors.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the mirrors is 'mirrors'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a mirror object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the mirror, which
                    is string.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined mirrors in the database.

 Returns:     List of fully initialized mirror objects.

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

