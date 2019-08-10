/* Verify checksum functions */

function verify_popup(strURL, strTitle) {
  /* Toolbar and Chrome features */
  var strOptions  = "menubar=no,location=no,resizable=yes,scrollbars=yes,";
  strOptions += "status=no,directories=no,personalbar=no,";
  /* Position and size */
  strOptions += "left=100,top=100,width=400,height=250";

  window.open(strURL, strTitle, strOptions);
}

function gen_verify_link(iPackId) {
  var VerifyMD5 = document.getElementById('VerifyMD5');

  if ( VerifyMD5 != null ) {
    var VerifyAnchor = document.createElement("a");
    var strAction = "verify_popup('pack.cgi?id=" + iPackId + "&amp;verifymd5=1', ";
    /* IE doesn't support free text window name as second argument, but
    * title is anyway generated for the displayed page
    */
    strAction += "'_blank'); return false;";

    VerifyAnchor.setAttribute("href", "#");
    VerifyAnchor.setAttribute("onclick", strAction);
    VerifyAnchor.setAttribute("onkeypress", strAction);
    VerifyAnchor.appendChild(document.createTextNode(l10n.VERIFY_LNK));
    VerifyMD5.appendChild(VerifyAnchor);
  }
  else {
    throw new Error('Element with id "VerifyMD5" not found!');
  }
}
