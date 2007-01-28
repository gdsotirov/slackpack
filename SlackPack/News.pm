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
# This module deals with site news
#
# $Id: News.pm,v 1.8 2007/01/28 12:34:52 gsotirov Exp $
#

package SlackPack::News;

use strict;
use SlackPack;
use Date::Parse;

use base qw(SlackPack::Object);

use constant DB_TABLE => 'news';
use constant NAME_FILED => 'title';
use constant ORDER_FIELD => 'published';
use constant REQUIRED_FIELDS => qw(title body published author);

sub DB_COLUMNS {
  return qw(id title body published updated author);
}

sub new {
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;

  my $self = $class->SUPER::new(@_);
  $self->_init_author;
  $self->{published} = str2time($self->{published});
  $self->{updated} = str2time($self->{updated});

  return $self;
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
     $query .= "LIMIT 10";
  my $ids = $dbh->selectcol_arrayref($query);

  my $news = [];
  foreach my $id (@$ids) {
    my $new_obj = $class->new($id);
    push @$news, $new_obj;
  }

  return $news;
}

# Management routines
sub add {
  my $dbh = SlackPack->dbh;
  my $title = $dbh->quote($_[0]->{'title'});
  my $body = $dbh->quote($_[0]->{'body'});
  my $dt = $dbh->quote($_[0]->{'datetime'});
  my $auth = $dbh->quote($_[0]->{'author'});

  my $query = "INSERT (`title`, `body`, `datetime`, `author`) INTO ".DB_TABLE." VALUES ($title, $body, $dt, $auth)";
  $dbh->do($query);

  if ( $dbh->err ) {
    return -1;
  }

  return $dbh->{'mysql_insertid'};
}

sub edit {
  my $dbh = SlackPack->dbh;
  my $title = $dbh->quote($_[0]->{'title'});
  my $body = $dbh->quote($_[0]->{'body'});
  my $dt = $dbh->quote($_[0]->{'datetime'});
  my $auth = $dbh->quote($_[0]->{'author'});

  my $query = "UPDATE ".DB_TABLE." SET `title` = $title, `body` = $body, `datetime` = $dt, `author` = $auth WHERE `id` = $_[0]";
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

SlackPack::News - A general representation of a site news

=head1 SYNOPSIS

my $new = new SlackPack::News(1);

print "News title = " . $new->{title};
$new->get_latest;

=head1 DESCRIPTION

This is a class which represents site news. It incorprorates all the data of
the news and provides general methods.

=head1 CONSTANTS

This class redefines some constants from SlackPack::Object

=over

=item C<DB_TABLE>

The database table for the packages is 'arch'.

=head2 Constructors

=over

=item C<new($id)>

 Description: The constructor is used to load a architecture object from
              the database by its identifier.

 Params:      $id - You should pass the identifier of the architecture, which
                    is a string.

 Returns:     A fully initialized object.

=back

=head2 General methods

=over

=item C<get_all>

 Description: This method lists all the published news.

 Returns:     List of fully initialized news objects.

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

