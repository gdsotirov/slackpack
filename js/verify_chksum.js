/**
 * @file Verify checksum functions
 * @author Georgi D. Sotirov <gdsotirov@gmail.com>
 */

/**
 * Displays pop up for verification of checksum.
 * @param {string} strURL URL for the popup window.
 * @param {string} strWinName Window name.
 */
function verify_popup(strURL, strWinName) {
  /* Toolbar and Chrome features */
  var strOptions  = "menubar=no,location=no,resizable=yes,scrollbars=yes,";
  strOptions += "status=no,directories=no,personalbar=no,";
  /* Position and size */
  strOptions += "left=100,top=100,width=400,height=250";

  /* Second argument is name, not title
   * See https://developer.mozilla.org/en-US/docs/Web/API/Window/open
   */
  window.open(strURL, strWinName, strOptions);
}

/**
 * Generate checksum verification anchor
 * @param {number} iPackId Package identifier.
 */
function gen_verify_link(iPackId) {
  var VerifyMD5 = document.getElementById('VerifyMD5');

  if ( VerifyMD5 != null ) {
    var VerifyAnchor = document.createElement("a");
    var strURL = "pack.cgi?id=" + iPackId + "&amp;verifymd5=1";

    var fAction = function() {
      verify_popup(strURL, 'VerifyChecksum');
      return false;
    };

    VerifyAnchor.href       = "#";
    VerifyAnchor.onclick    = fAction;
    VerifyAnchor.onkeypress = fAction;
    VerifyAnchor.text       = l10n.VERIFY_LNK;
    VerifyMD5.appendChild(VerifyAnchor);
  }
  else {
    throw new Error('Element with id "VerifyMD5" not found!');
  }
}
