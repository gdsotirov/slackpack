# SlackPack 
[![Build Status](https://travis-ci.com/gdsotirov/slackpack.svg?branch=master)](https://travis-ci.com/gdsotirov/slackpack)

About
------------------------------------------------------------------------------
SlackPack was initially intended to be only a web interface to the
Slackware package repositories of Georgi Sotirov. Currently however it is
becoming more like a system for management of Slackware packages. Still there
is much work to be done, e.g. all the backend system for editing existing and
registering new packages is not ready. This however is under way for the next
release.

SlackPack interface is presenting the user with a way to search and browse
packages by category or Slackware version. Packages can be completely
reviewed before download. In future registered users will be able to post
comments to the packages and request new package builds. You can keep current
with the variety of site feeds that are offered.

Advanced users may find the repositories useful for automatic update with
tools like swaret, slapt-get and slackpkg.

Most of SlackPack is written in Perl using a bunch of handy modules like
Template, File and Date. Site interface is HTML5 styled with CSS with few
simple JavaScripts. Some handy tolls are written in shell.

Requirements
------------------------------------------------------------------------------
The following are required to run the software:

 * Perl 5 with the following modules:
   - [CGI](https://metacpan.org/pod/CGI) (for handling CGI requests and responses);
   - [DBI](https://metacpan.org/pod/DBI) (for database access);
   - [Date::Parse](https://metacpan.org/pod/Date::Parse) (for str2time function to convert string to time);
   - [Exporter](https://metacpan.org/pod/Exporter) (for exporting error handling functions);
   - [File::Basename](https://metacpan.org/pod/File::Basename) (for dirname function to strip filename from path);
   - [HTML::Entities](https://metacpan.org/pod/HTML::Entities) (for encode_entities function to encode HTML entities);
   - [HTML::TreeBuilder](https://metacpan.org/pod/HTML::TreeBuilder) (for generating HTML document with completed form);
   - [HTTP::Cookies](https://metacpan.org/pod/HTTP::Cookies) (for cookie jar in linuxpackages.net registration);
   - [HTTP::Date](https://metacpan.org/pod/HTTP::Date) (for time2isoz function setting cookie expiration date);
   - [HTTP::Headers::Util](https://metacpan.org/pod/HTTP::Headers::Util) (for join_header_words function to join cookie data);
   - [I18N::AcceptLanguage](https://metacpan.org/pod/I18N::AcceptLanguage) (for multilingual templates support);
   - [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) (for web user agent in linuxpackages.net registration);
   - [MIME::Base64](https://metacpan.org/pod/MIME::Base64) (for encode_base64 function to encode mirror logos);
   - [POSIX](https://metacpan.org/pod/distribution/perl/ext/POSIX/lib/POSIX.pod) (for access to POSIX functions like ceil);
   - [Template](https://metacpan.org/pod/Template) (for templates processing);
 * MySQL 5.1 (with support for stored routines, views, triggers and event
   scheduler) or above;
 * Shell (any).

License
------------------------------------------------------------------------------
The entire SlackPack software including the packages are licensed under the
General Public License (GPL). See file [COPYING](COPYING) for details.

Please, note that some of the software bundled in the packages can be with
different than GPL license (MPL, MIT, Skype, Opera, etc).

Copyrights
------------------------------------------------------------------------------
Linux is a Registered Trademark of Linus Torvalds.

Slackware is a registered trademark of Patrick Volkerding and Slackware Linux, Inc.

Credits
------------------------------------------------------------------------------
See file [AUTHORS](AUTHORS).

