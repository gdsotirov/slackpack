/**
 * @file Search results functions (show and hide full matched contents)
 * Requires: Localization support (i.e. include l10n.*.js script before)
 * @author Georgi D. Sotirov <gdsotirov@gmail.com>
 */

/**
 * Expand list of matching package contents in search results
 */
function toggle_contents_on() {
  var tds = document.getElementsByClassName("matching_contents");
  var lnk = document.getElementById("CntntsTglLnk");

  for ( var i = 0; i < tds.length; i++ ) {
    tds[i].style.overflow = "visible";
    tds[i].style.whiteSpace = "normal";
  }

  lnk.href = "javascript:toggle_contents_off()";
  lnk.text = l10n.SHOWLESS_LNK;
}

/**
 * Collapse list of matching package contents in search results
 */
function toggle_contents_off() {
  var tds = document.getElementsByClassName("matching_contents");
  var lnk = document.getElementById("CntntsTglLnk");

  for ( var i = 0; i < tds.length; i++ ) {
    tds[i].style = "";
  }

  lnk.href = "javascript:toggle_contents_on()";
  lnk.text = l10n.SHOWALL_LNK;
}

