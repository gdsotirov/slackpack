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
# This is representation of a package
#
# $Id: Package.pm,v 1.38 2007/02/08 19:31:40 gsotirov Exp $
#

package SlackPack::Package;

use strict;
use SlackPack;
use SlackPack::Arch;
use SlackPack::Category;
use SlackPack::License;
use SlackPack::Slackver;
use SlackPack::User;
use Date::Parse;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'packages';
use constant ORDER_FIELD => 'filedate';
use constant REQUIRED_FIELDS => qw(
  name
  version
  build
  license
  arch
  slackver
  description
  category
  filename
  filesize
  fileurl
  filemd5
  filedate
  author
);

sub DB_COLUMNS {
  return qw(
    id
    name
    title
    version
    build
    license
    arch
    slackver
    url
    description
    category
    slackbuild
    frombinary
    filename
    filesize
    fileurl
    filemd5
    filesign
    author),
    "DATE_FORMAT(releasedate, '%Y-%m-%d') AS releasedate",
    "DATE_FORMAT(filedate, '%Y-%m-%d %H:%i:%s') AS filedate";
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  $self->_init_license;
  $self->_init_arch;
  $self->_init_slackver;
  $self->_init_category;
  $self->_init_author;
  $self->{filedate} = str2time($self->{filedate});

  return $self;
}

# Prevent returning of all package data
sub get_all {
  return [];
}

# Referenced objects initializers and getters
sub _init_license {
  my ($self) = @_;
  return $self->{license} if UNIVERSAL::isa($self, 'SlackPack::License');
  $self->{license} = new SlackPack::License($self->{license});
  return '' if $self->{license}{error};
  return $self->{license};
}

sub _init_arch {
  my ($self) = @_;
  return $self->{arch} if UNIVERSAL::isa($self, 'SlackPack::Arch');
  $self->{arch} = new SlackPack::Arch($self->{arch});
  return '' if $self->{arch}{error};
  return $self->{arch};
}

sub _init_slackver {
  my ($self) = @_;
  return $self->{slackver} if UNIVERSAL::isa($self, 'SlackPack::Slackver');
  $self->{slackver} = new SlackPack::Slackver($self->{slackver});
  return '' if $self->{slackver}{error};
  return $self->{slackver};
}

sub _init_category {
  my ($self) = @_;
  return $self->{category} if UNIVERSAL::isa($self, 'SlackPack::Category');
  $self->{category} = new SlackPack::Category($self->{category});
  return '' if $self->{category}{error};
  return $self->{category};
}

sub _init_author {
  my ($self) = @_;
  return $self->{author} if UNIVERSAL::isa($self, 'SlackPack::User');
  $self->{author} = new SlackPack::User($self->{author});
  return '' if $self->{author}{error};
  return $self->{author};
}

sub get_latest {
  my $class = shift;
  my $dbh = SlackPack->dbh;
  my $table = $class->DB_TABLE;
  my $id_field = $class->ID_FIELD;
  my $order_field = $class->ORDER_FIELD;

  my $query  = "SELECT $id_field ";
     $query .= "FROM $table ";
     $query .= "ORDER BY $order_field DESC ";
     $query .= "LIMIT 20";
  my $ids = $dbh->selectcol_arrayref($query);

  my $packs = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$packs, $new_obj;
  }

  return $packs;
}

sub get_history {
  my $self = shift;
  my $dbh = SlackPack->dbh;
  my $table = $self->DB_TABLE;
  my $id_field = $self->ID_FIELD;
  my $order_field = $self->ORDER_FIELD;
  my $name = $dbh->quote($self->{name});
  my $arch = $dbh->quote($self->{arch}{id});
  my $sver = $dbh->quote($self->{slackver}{id});
  my $id = $dbh->quote($self->{id});

  my $query  = "SELECT $id_field ";
     $query .= "FROM $table ";
     $query .= "WHERE name = $name ";
     $query .= "  AND arch = $arch ";
     $query .= "  AND slackver = $sver ";
     $query .= "  AND id <> $id ";
     $query .= "ORDER BY $order_field DESC";
  my $ids = $dbh->selectcol_arrayref($query);

  my $packs = [];
  foreach my $id (@$ids) {
    my $new = new SlackPack::Package($id);
    push @$packs, $new;
  }

  return $packs;
}

sub get_formats {
  my $self = shift;
  my $dbh = SlackPack->dbh;
  my $table = $self->DB_TABLE;
  my $id_field = $self->ID_FIELD;
  my $order_field = $self->ORDER_FIELD;
  my $name = $dbh->quote($self->{name});
  my $arch = $dbh->quote($self->{arch}{id});
  my $sver = $dbh->quote($self->{slackver}{id});
  my $id = $dbh->quote($self->{id});

  my $query  = "SELECT $id_field ";
     $query .= "FROM $table ";
     $query .= "WHERE name = $name ";
     $query .= "  AND (arch <> $arch OR slackver <> $sver) ";
     $query .= "  AND id <> $id ";
     $query .= "ORDER BY $order_field DESC";
  my $ids = $dbh->selectcol_arrayref($query);

  my $packs = [];
  foreach my $id (@$ids) {
    my $new = new SlackPack::Package($id);
    push @$packs, $new;
  }

  return $packs;
}

sub list_contents {
  my $self = shift;
  my $dbh = SlackPack->dbh;

  if ( $self ) {
    my $file = SlackPack->LOCAL_ROOT."".$self->{'fileurl'};
    return `tar tzvf $file`;
  }

  return "";
}

sub search {
  my $self = shift;
  my $dbh = SlackPack->dbh;
  my ($params, $count, $offset) = @_;
  my $table = $self->DB_TABLE;
  my $id_field = $self->ID_FIELD;
  my $name_field = $self->NAME_FIELD;
  my $order_field = $self->ORDER_FIELD;

  $count ||= 0;
  $offset ||= 0;

  my $query  = "SELECT $id_field ";
     $query .= "FROM $table ";
     $query .= "WHERE ";
  if ( !$params->{name} ) {
     $query .= "  $name_field = $name_field ";
  }
  else {
     my $name = $params->{name};
     my @terms = split(/\s+/, $name);
     my $count = 0;

     foreach my $term (@terms) {
       $term = $dbh->quote("%$term%");
       if ( $count ) {
         $query .= " OR $name_field LIKE $term";
         $query .= " OR title LIKE $term"
       }
       else {
         $query .= "  (($name_field LIKE $term";
         $query .= "    OR title LIKE $term)"
       }
       ++$count;
     }
     $query .= ")";
  }
  if ( $params->{version} ) {
     my $version = $dbh->quote($params->{version} . "%");
     $query .= "  AND version LIKE $version ";
  }
  if ( $params->{arch} ) {
    if ( $params->{arch} eq "x86" ) {
     $query .= "  AND (arch = 'i386' OR arch = 'i486' OR arch = 'i586' OR arch = 'i686') ";
    }
    else {
     my $arch = $dbh->quote($params->{arch});
     $query .= "  AND arch = $arch ";
    }
  }
  if ( $params->{category} ) {
     my $cat = $dbh->quote($params->{category});
     $query .= "  AND category = $cat ";
  }
  if ( $params->{slackver} ) {
     my $sver = $dbh->quote($params->{slackver});
     $query .= "  AND slackver = $sver ";
  }
  if ( $params->{slackbuild} eq "yes" ) {
     $query .= "  AND slackbuild = 'yes' ";
  }
  if ( $params->{nobin} eq "yes" ) {
     $query .= "  AND frombinary = 'no' ";
  }
     $query .= "ORDER BY $order_field DESC ";
     $query .= "LIMIT $offset,$count" if $count > 0;
  my $ids = $dbh->selectcol_arrayref($query);

  my $packs = [];
  foreach my $id (@$ids) {
    my $new = new SlackPack::Package($id);
    push @$packs, $new;
  }

  return $packs;
}

# Management routines
sub add {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT 1+1";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;

  my $query = "SELECT 1+1";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return 0;
}

sub remove {
  my $dbh = SlackPack->dbh;

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

SlackPack::Package - A general representation of a package

=head1 SYNOPSIS

my $pack = new SlackPack::Package(135);

print "Package name = " . $pack->{name};
$pack->list_contents;

=head1 DESCRIPTION

This is a class which represents a Slackware Package. It incorprorates
all the data of the package and provides methods for general tasks.

=head1 CONSTANTS

This class redefins some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the packages is 'packages'.

=back

=head1 METHODS

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a package object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the package, which
                    is integer.

 Returns:     A fully initialized object. This includes the referenced
              objects also.

=back

=head2 General methods

=over

=item C<get_history>

 Description: This method retrieves the history of a package, e.g. packages of
              the same software distribution.

 Returns:     A list of packages ordered by the date of their file creation.

=item C<list_contents>

 Description: This method provides a tree like list of package contents.

 Returns:     Text

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

