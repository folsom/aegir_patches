Overview
========

File location:  /var/aegir/.drush/provision/platform
File patched :  provision_drupal.drush.inc
Aegir version:  3.15.1
Date Created :  02/13/17
Date Updated :  10/17/17
                02/20/18
                07/19/18

This patch is required in our situation where the platforms directories are NFS mounted on hostmaster as well 
as all web nodes.  We have received rsync errors in specific situations during verify or clone tasks that 
we are unable to determine the cause of.  

This patch bypasses the rysnc process for the site level filesystem since the NFS shares take care of 
making sure files are available to all the web nodes already.

The original Aegir core file is in ./original.

Changes:

10/16/17 -
The patch is the same but was updated for the new source file...that is, the change the patch
makes is outside the block/blocks of code that changed in the new 3.12.1 source file.
02/20/18 -
Ditto to above but for version 3.14.2.
07/19/18 -
Ditto again for version 3.15.1.


Application
==========

cd /var/aegir/.drush/provision/platform
$ patch < /var/aegir/aegir_patches/bypass_site_rsync/provision_drupal.drush.inc.patch
