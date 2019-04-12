Overview
========

Files patched     :  drush/hosting_site_backup_manager.drush.inc
                  :  hosting_site_backup_manager.module
Aegir version     :  3.15.1
Date Created      :  03/09/17
Last Date Modified:  03/07/19

This patch both moves the Aegir hosting_site_backup_manager module's drush include file
to a back-end uo_provision location and then modifies it to copy a backup to a new
location for export rather than making a hard link.  The hard link fails in our
environment because the back-up directory is on an NFS share--links can't go across
filesystems.

The original Aegir file is in ./original.

Changes:

10/17/17 -
Added our change into the new 3.12.1 source file, which had changed in places since 3.9
that broke the original patch.

11/02/17 - 
It turns out that the file can stay in its original location, so it will no longer
be moved.

03/07/19 -
This module broke when used under PHP 7.2, with the 'Backups' tab causing a 500 error.  The
patch 'hosting_site_backup_manager.module.patch' was added to fix this.  The maintainers have
also applied this patch against the Git repo, so the next version of Aegir should include
it (probably 3.17.4).


Application
==========

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting_site_backup_manager
cp -p hosting_site_backup_manager.module hosting_site_backup_manager.module.orig
patch < /var/aegir/aegir_patches/hosting_site_backup_manager/hosting_site_backup_manager.module.patch

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting_site_backup_manager/drush
cp -p hosting_site_backup_manager.drush.inc hosting_site_backup_manager.drush.inc.orig
patch < /var/aegir/aegir_patches/hosting_site_backup_manager/hosting_site_backup_manager.drush.inc.patch
