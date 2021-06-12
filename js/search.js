/**
 * @file Search form functions
 * Requires: Localization support (i.e. include l10n.*.js script before)
* @author Georgi D. Sotirov <gdsotirov@gmail.com>
 */

/**
 * Checks whether user entered search terms
 * @returns True if user entered some search terms, otherwise false
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

/**
 * Displays a dialog box for confirming clearing of search results
 * @returns True if user confirmed, otherwise false
 */
function ConfirmReset() {
  return confirm(l10n.CONFIRM_RESET);
}

