Overview
========

File location:  /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/site
Files patched:  hosting_site.form.inc
Dependencies:   hosting_package_mods/hosting_package.module.patch
Aegir version:  3.14.2
Date Created :  04/24/17
Date Modified:  10/17/17
                02/20/18
                

Changes were made to the hosting_site_form() function to improve performance.  If the form is being used to
edit an existing site node and the platform is known, code that builds a full list of available 
platforms is bypassed.  Also, if the form is being used to create a new site and the platform is
passed in as a query parameter, some code is now bypassed that wasn't previously and the platform
is passed into the hosting_get_profile_platforms() function.

This patch can stand on its own but was created at the same time as the patch hosting_package.module.patch.
That patch modified hosting_package.module such that the optional 'platform' parameter is accepted
by hosting_get_profile_platforms() when the platform is known.

The original Aegir core file is in ./original.

Changes:

10/17/17 -
Integrated change into new source file from 3.12.1.
02/20/18 -
Updated the patch for the new source file from 3.14.2, though the patch was not affected.

Application
==========

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/site
cp -p hosting_site.form.inc hosting_site.form.inc.orig
patch < /var/aegir/aegir_patches/hosting_site_mods/hosting_site.form.inc.patch
