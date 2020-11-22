# SlackPack
# Copyright (C) 2006-2020  Georgi D. Sotirov, gdsotirov@gmail.com
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
# Check syntax of templates

use strict;
use warnings;

use lib 't';

use Template;
use Test::Files;
use Test::More tests => (scalar(@Test::Files::templates));
use SlackPack::Util;

my $tprov = Template::Provider->new({
  INCLUDE_PATH => '.',
  RELATIVE => 1,
  FILTERS => {
    xml       => \&SlackPack::Util::xml_quote,
    desc_xml  => \&SlackPack::Util::format_desc_xml,
    desc_html => \&SlackPack::Util::format_desc_html,
    html      => sub {
                   return Template::Filters::html_filter(@_);
                 },
    url       => \&SlackPack::Util::url_quote,
    email     => \&SlackPack::Util::email_obfuscate,
    base64    => \&SlackPack::Util::base64_enc
  },
  PRE_CHOMP    => 1,
  TRIM         => 1
});

foreach my $template (@Test::Files::templates) {
  my ($err, $status) = $tprov->fetch($template);

  if ( !$status ) {
    ok(1, "$template syntax OK");
  }
  else {
    ok(0, "$template has syntax problem(s) --ERROR");
    diag($err . "\n");
  }
}

