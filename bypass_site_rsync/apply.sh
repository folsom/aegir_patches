echo 'Applying bypass site rsync patch'

cd /var/aegir/.drush/provision/platform

cp -p provision_drupal.drush.inc provision_drupal.drush.inc.orig
patch < /var/aegir/aegir_patches/bypass_site_rsync/provision_drupal.drush.inc.patch
