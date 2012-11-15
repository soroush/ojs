<?php

print "<h1>License selector</h1>";

if ($_GET['license_url']) {
  $license_url = $_GET['license_url'];
  $license_name = $_GET['license_name'];
  if ($_GET['lang'] == 'fr') {
    print "<p>";
    print "Vous avez choisissez le contrat &laquo; <a href=\"" . $license_url . "\">" . $license_name . "</a> &raquo;.";
    print "</p>";
  }
  else {
    print "<p>";
    print "You have chosen the \"<a href=\"" . $license_url . "\">" . $license_name . "</a>\" license.";
    print "</p>";
  }
 }
 else {
   print "<ul>";
   print "<li><a href=\"http://creativecommons.org/choose/?partner=test&exit_url=http://131.104.62.22/license.php?license_url=[license_url]%26license_name=[license_name]%26lang=en&jurisdiction=ca&lang=en\">Choose a license</a></li>";
   print "<li><a href=\"http://creativecommons.org/choose/?partner=test&exit_url=http://131.104.62.22/license.php?license_url=[license_url]%26license_name=[license_name]%26lang=fr&jurisdiction=ca&lang=fr\">Choisissez un contrat</a></li>";
   print "</ul>";
 }

?>
