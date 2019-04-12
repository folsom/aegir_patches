echo 'Appying hosting_site_backup_manager patches...'

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting_site_backup_manager
cp -p hosting_site_backup_manager.module hosting_site_backup_manager.module.orig
patch < /var/aegir/aegir_patches/hosting_site_backup_manager/hosting_site_backup_manager.module.patch

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting_site_backup_manager/drush
cp -p hosting_site_backup_manager.drush.inc hosting_site_backup_manager.drush.inc.orig
patch < /var/aegir/aegir_patches/hosting_site_backup_manager/hosting_site_backup_manager.drush.inc.patch
