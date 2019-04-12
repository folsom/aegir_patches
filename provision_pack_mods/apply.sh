
echo 'Applying provision pack mods patch...'


cd /var/aegir/.drush/provision/http/Provision/Service/http
cp -p pack.php pack.php.orig
patch < /var/aegir/aegir_patches/provision_pack_mods/pack.php.patch


cd /var/aegir/.drush/provision/Provision/Context
cp -p server.php server.php.orig
patch < /var/aegir/aegir_patches/provision_pack_mods/server.php.patch
