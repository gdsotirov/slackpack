/* Script : Mirrors update
 * Purpose: Remove unused fields in the mirros table
 */

ALTER TABLE `slackpack`.`mirrors`
 DROP COLUMN `protocol`,
 DROP COLUMN `rel_url`
;
