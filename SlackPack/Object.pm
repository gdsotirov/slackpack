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
# A base class for objects in SlackPack
#

package SlackPack::Object;

use strict;
use SlackPack;

use constant ID_ISNUMERIC=> 0; # alpha-numeric identifiers by default
use constant ID_FIELD    => 'id';
use constant ID_STR_FIELD=> 'id';
use constant NAME_FIELD  => 'name';
use constant ORDER_FIELD => 'name';

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $id = shift;
  # Trim eventual whitespace
  $id =~ s/^\s*//s;
  $id =~ s/\s*$//s;

  if ( $id eq "" ) {
    my $error = {};
    bless $error, $class;
    $error->{'error'} = 'NoId';

    return $error;
  }

  # identifier is numeric
  if ( $class->ID_ISNUMERIC ) {
      if ( $id !~ /^\-?[\d]+$/ || $id <= 0 ) {
        my $error = {};
        bless $error, $class;
        $error->{'id'} = $id;
        $error->{'error'} = 'InvalidNumId';

        return $error;
      }
  }
  # or alpha-numeric
  elsif ( $id !~ /^[\d\w\-_]+$/ )
  {
    my $error = {};
    bless $error, $class;
    $error->{'id'} = $id;
    $error->{'error'} = 'InvalidId';

    return $error;
  }

  unshift @_, $id;
  my $object = $class->_init(@_);
  bless($object, $class) if $object;
  return $object;
}

sub _init {
  my $class = shift;
  my ($id) = @_;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $columns = join(', ', $class->DB_COLUMNS);

  if ( $id =~ /^[[:alpha:]]+$/ )
  {
    $id_field = $class->ID_STR_FIELD;
  }

  my $object;
  # Identifier is already checked to be all numeric or all character value
  if ( defined $id ) {
    $object = $dbh->selectrow_hashref(qq{
      SELECT $columns
        FROM $table
       WHERE $id_field = } . $dbh->quote($id));
  }

  if ( !$object ) {
    my $error = {};
    bless $error, $class;
    $error->{'id'} = $id;
    $error->{'error'} = 'NotFound';

    return $error;
  }

  return $object;
}

sub get_all {
  my $class = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field\n";
     $query .= "  FROM $table\n";
     $query .= " ORDER BY $order_field";
  my $ids = $dbh->selectcol_arrayref($query);

  my $objs = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$objs, $new_obj;
  }

  return $objs;
}

1;


__END__

=head1 NAME

SlackPack::Object - A base class for objects in SlackPack.

=head1 SYNOPSIS

 my $object = new SlackPack::Object(1);
 my $object = new SlackPack::Object({id => '12'});

 my $id          = $object->id;
 my $name        = $object->name;

=head1 DESCRIPTION

SlackPack::Object is a base class for all SlackPack objects.
You should not directly create objects from it. SlackPack::Object
exists with the sole purpose to be subclassed by real life
classes.

=head1 CONSTANTS
