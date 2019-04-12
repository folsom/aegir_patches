Overview
========

File location:  /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/package
Files patched:  hosting_package.module
Dependencies :  hosting_site_mods/hosting_site.form.inc.patch
Aegir version:  3.15.1
Date Created :  04/24/17
Last Modified:  03/13/19

Changes were made to hosting_get_profile_platforms() that keep code from being executed that isn't
needed under special conditions.  The function was modified to allow a single platform NID to
be passed in.  Any code not needed when the platform being acted on is known is bypassed.
Also, platforms are checked for client-based access by the current user and some processing
is bypassed if the user doesn't have access to them.

This patch can stand on its own but was created at the same time as the patch hosting_site_form.inc.patch.
That patch modified hosting_site_form.inc such that the optional 'platform' parameter is passed 
into hosting_get_profile_platforms() when the platform is known.

The original Aegir core file is in ./original.

Changes:

05/04/17 update:

Don't process platforms that are locked or deleted, since they are not available for site creation.

10/17/17 -
Integrated patch change with new source file for 3.12.1.  There was only one change to the new file
from the origin 3.9 one and it is in a line that is removed by the patch.

03/13/19 -
Added a patch to remove a looped query to the 'hosting_package_languages' table, which looks like
it is severely bogging down opening the clone modal or site creation page.  We don't use multi-language
support in Aegir and so don't need this.


Application
==========

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/package
cp -p hosting_package.module hosting_package.module.orig
patch < /var/aegir/aegir_patches/hosting_package_mods/hosting_package.module.patch

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/package
cp -p hosting_package.instance.inc hosting_package.instance.inc.orig
patch < /var/aegir/aegir_patches/hosting_package_mods/hosting_package.instance.inc.patch
