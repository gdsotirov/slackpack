/* Script : Initialize column package_deps.own_pkg
 * Purpose: Set new column package_deps.own_pkg to TRUE where dependency
 *          could be satisfied by own package
 */

UPDATE package_deps PD,
       packages     P
   SET PD.own_pkg = TRUE
 WHERE PD.dep_name IN (SELECT DISTINCT `name` from packages)
   AND PD.pack_id = P.id
   AND PD.own_pkg = FALSE
   AND EXISTS (SELECT 1
                 FROM packages
                WHERE `name`   = PD.dep_name
                  AND slackver = P.slackver
                  and arch     = P.arch
                  AND `status` = 'ok');

