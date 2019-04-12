Overview
========

File location :  /var/aegir/.drush/provision/Provision/Config/Drupal
Files patched :  provision_drupal_settings_7.tpl.php
                 provision_drupal_settings_8.tpl.php
                 vhost_disabled.tpl.php
Aegir version :  3.17.2
Date Created  :  04/02/19
Date Updated  :  


provision_drupal_settings_7.tpl.php
 * Changed 'session.cookie_lifetime' from 2,000,000 to 28800.  That is, the
   lifetime of the Drupal session cookie goes from about 23 days to 8 hours.  
   This matches the Shibboleth session lifetime and thus should make sure that
   both expire at the same time.  When the Drupal session cookie is still around
   after the Shib cookie expires, it causes a redirection to the Shib logout page
   when someone tries to visit any page, even ones that aren't protected behind
   a login.
provision_drupal_settings_8.tpl.php
  * Same as above but for Drupal 8 sites.

The original Aegir core files are in ./original.

Changes:


Application
===========

* To apply:

cd /var/aegir/.drush/provision/Provision/Config/Drupal

cp -p provision_drupal_settings_7.tpl.php provision_drupal_settings_7.tpl.php.orig
patch < /var/aegir/aegir_patches/provision_config_mods/provision_drupal_settings_7.tpl.php.patch

cp -p provision_drupal_settings_8.tpl.php provision_drupal_settings_8.tpl.php.orig
patch < /var/aegir/aegir_patches/provision_config_mods/provision_drupal_settings_8.tpl.php.patch
