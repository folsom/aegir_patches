Overview
========

File location:  /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/task
Files patched:  hosting_task.module
Aegir version:  3.15.1
Date Created :  06/08/17
Last Modified:  02/16/18
                02/20/18
                08/29/18

This patch adds a "Custom platform tasks" text entry field to the Hosting's Settings page, 
which allows for the entry of platform task names that should be listed in the platform
task list of the platform node display page.  By design, this list is retricted by a 
hard-coded list in the 'hosting_task.module' file.

The original Aegir core file is in ./original.

Changes:

10/17/17 -
Updated for 3.12.1.  The 3.9 patch worked as it was, since the modifications
to the source for 3.12.1 were untouched by it.
02/16/18 -
Fixed a bug in the 'hosting_task_count_running()' function's query that was
causing the function to always return '0'. 
02/20/18 -
Updated for 3.14.2.  The source code changed but the patch still worked.  So the
new source was put in 'original' and a new patch generated.
08/29/18 -
Fix noted above for 02/16/18 is now in core release as of 3.15.1, so removed 
from patch.  Also, patch updated for modified 3.15.1 code beyond this.

Application
==========

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/task
cp -p hosting_task.module hosting_task.module.orig
patch < /var/aegir/aegir_patches/hosting_task_mods/hosting_task.module.patch
