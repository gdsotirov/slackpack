#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006-2026  Georgi D. Sotirov, gdsotirov@gmail.com
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
# This is representation of the different Slackware versions
#

package SlackPack::Slackver;

use strict;
use SlackPack;
use Date::Parse;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'slackvers';
use constant ORDER_FIELD => 'released';
use constant REQUIRED_FIELDS => qw(name released);

sub DB_COLUMNS {
  return qw(id
            name
            released
            annon_url
            eol
            def
            packages_total
            packages
            str
            active);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  $self->{released} = str2time($self->{released});

  return $self;
}

# This method is redefined here the change order direction
sub get_all {
  my $class = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field\n";
     $query .= "  FROM $table\n";
     $query .= " ORDER BY $order_field DESC";
  my $ids = $dbh->selectcol_arrayref($query);

  my $objs = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$objs, $new_obj;
  }

  return $objs;
}

# Retrieve only versions opened for package registration
sub get_all_active {
  my $class = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field\n";
     $query .= "  FROM $table\n";
     $query .= " WHERE active = TRUE\n";
     $query .= " ORDER BY $order_field DESC";
  my $ids = $dbh->selectcol_arrayref($query);

  my $objs = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$objs, $new_obj;
  }

  return $objs;
}

# Retrieve only versions that are not EOLed and opened for package registration
sub get_all_not_eol {
  my $class = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field\n";
     $query .= "  FROM $table\n";
     $query .= " WHERE eol IS NULL\n";
     $query .= "   AND active = TRUE\n";
     $query .= " ORDER BY $order_field DESC";
  my $ids = $dbh->selectcol_arrayref($query);

  my $objs = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$objs, $new_obj;
  }

  return $objs;
}

# Management routines
sub add {
  my $dbh = SlackPack->dbh;
  my $id = $dbh->quote($_[1]->{'id'});
  my $name = $dbh->quote($_[1]->{'name'});
  my $def = $_[1]->{'def'};

  my $query  = "INSERT (`id`, `name`, `def`) INTO ".DB_TABLE."\n";
     $query .= "VALUES ($id, $name, $def)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $new_id = $dbh->quote($_[1]->{'id'});
  my $name = $dbh->quote($_[1]->{'name'});
  my $def = $_[1]->{'def'};

  my $query  = "UPDATE ".DB_TABLE."\n";
     $query .= "   SET `id`     = $new_id,\n";
     $query .= "       `name`   = $name,\n";
     $query .= "       `default`= $def\n";
     $query .= " WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

  my ($name, $def) = get($_[1]);
  if ( $def == 'yes' ) {
    return -1;
  }

  my $query = "DELETE FROM ".DB_TABLE." WHERE `id` = $_[0]";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

1;


__END__

=head1 NAME

SlackPack::Slackver - A general representation of a slackware version

=head1 SYNOPSIS

my $sver = new SlackPack::Slackver(110);

print "Slackware " . $sver->{name} . " released " . $sver->{released};
$sver->get_all;

=head1 DESCRIPTION

This is a class which represents a Slackware version. It incorporates all
the data of the version and provides method for listing all available
versions.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the versions is 'slackver'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a architecture object from
              the database by its identifier.


 Params:      $id - You should pass the identifier of the architecture, which
                    is integer. The identifier is composite integer number. It
                    is computed from the major and minor versions of the
                    Slackware version by the following formula:

=over

identifier = major * 10 + minor

=back

                    Thus the identifier of Slackware 11.0 will be 110 and the
                    identifier of Slackware 9.1 will be 91.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all defined versions in the database.

 Returns:     List of fully initialized version objects.

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

