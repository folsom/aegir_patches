echo 'Appying db.php patch for re-ordering database/user creation and deletion...'

cd /var/aegir/.drush/provision/db/Provision/Service/
cp -p db.php db.php.orig
patch < /var/aegir/aegir_patches/reorder_ops_db/db.php.patch
