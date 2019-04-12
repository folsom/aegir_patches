echo 'Appying hosting_site_mods hosting_site.form.inc  patch...'

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/site

cp -p hosting_site.form.inc hosting_site.form.inc.orig
patch < /var/aegir/aegir_patches/hosting_site_mods/hosting_site.form.inc.patch
