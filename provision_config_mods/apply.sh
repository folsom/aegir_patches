echo 'Appying Provision config template patches...'

cd /var/aegir/.drush/provision/Provision/Config/Drupal

cp -p provision_drupal_settings_7.tpl.php provision_drupal_settings_7.tpl.php.orig
patch < /var/aegir/aegir_patches/provision_config_mods/provision_drupal_settings_7.tpl.php.patch
cp -p provision_drupal_settings_8.tpl.php provision_drupal_settings_8.tpl.php.orig
patch < /var/aegir/aegir_patches/provision_config_mods/provision_drupal_settings_8.tpl.php.patch
