echo 'Appying hosting_package_mods hosting_package.module patch...'

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/package

cp -p hosting_package.module hosting_package.module.orig
patch < /var/aegir/aegir_patches/hosting_package_mods/hosting_package.module.patch

echo 'Appying hosting_package_mods hosting_package.instance.inc.patch patch...'

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/package

cp -p hosting_package.instance.inc hosting_package.instance.inc.orig
patch < /var/aegir/aegir_patches/hosting_package_mods/hosting_package.instance.inc.patch
