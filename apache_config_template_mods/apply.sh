echo 'Appying Apache config templates patch...'

cd /var/aegir/.drush/provision/http/Provision/Config/Apache

cp -p platform.tpl.php platform.tpl.php.orig
patch < /var/aegir/aegir_patches/apache_config_template_mods/platform.tpl.php.patch
cp -p server.tpl.php server.tpl.php.orig
patch < /var/aegir/aegir_patches/apache_config_template_mods/server.tpl.php.patch
cp -p subdir.tpl.php subdir.tpl.php.orig
patch < /var/aegir/aegir_patches/apache_config_template_mods/subdir.tpl.php.patch
cp -p vhost.tpl.php vhost.tpl.php.orig
patch < /var/aegir/aegir_patches/apache_config_template_mods/vhost.tpl.php.patch
cp -p vhost_disabled.tpl.php vhost_disabled.tpl.php.orig
patch < /var/aegir/aegir_patches/apache_config_template_mods/vhost_disabled.tpl.php.patch
