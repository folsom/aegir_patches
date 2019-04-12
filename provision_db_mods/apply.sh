echo 'Appying mysql.php patch...'

cd /var/aegir/.drush/provision/db/Provision/Service/db/
cp -p mysql.php mysql.php.orig
patch < /var/aegir/aegir_patches/provision_db_mods/mysql.php.patch
