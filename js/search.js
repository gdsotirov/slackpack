/* Search form functions
 * Requires: Localization support (i.e. include l10n.*.js script before)
 */

function CheckTerms() {
  var f = document.forms.AdvSearch;
  if ( f.name.value == "" ) {
    alert(l10n.NO_TERMS_ERR);
    f.name.focus();
    return false;
  }
  return true;
}

function ConfirmReset() {
  return confirm(l10n.CONFIRM_RESET);
}
