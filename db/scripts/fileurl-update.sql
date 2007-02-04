/* This script is intended to update the relative package URLs, so
 * they can be easaly used with relative mirror URLs.
 * The information that should be stripped is
 *
 *  /pub/contrib/slackware/packages/
 *  |<------------- 32 ----------->|
 *
 * or effectively 32 characters from the begining of the string.
 */

UPDATE packages
   SET fileurl = SUBSTR(fileurl, 33);

