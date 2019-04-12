Overview
========

File location :  /var/aegir/.drush/provision/http/Provision/Config/Apache
Files patched :  platform.tpl.php
                 server.tpl.php
                 subdir.tpl.php
                 vhost.tpl.php
                 vhost_disabled.tpl.php
Aegir version :  3.17.2
Date Created  :  11/17/16
Date Updated  :  04/26/17
                 10/16/17
                 02/19/18
                 04/10/18
                 07/27/18
                 08/10/18  
                 03/19/19
                 03/28/19


platform.tpl.php.patch:
 * This patch removes the "Satisfy all" directive from the platform template's
<Directory> block.  This is necessary because the directive prevents Shibboleth
environment variables set by the shib_auth Drupal module from being injected
into the session.  
 * The patch file also replace the Apache 2.2 access directives with the new ones 
   required for Apache 2.4.

server.tpl.php.patch:
 * Removes the NameVirtualHost directive, which isn't used with Apache 2.4.
 * Removes the rewrite for the LetsEncrypt target.  I believe the intended purpose of this rule
   is to allow only the LetsEncrypt-style URLs through and redirect all other requests here 
   such that they return a 404. Previous versions of this file had a "Redirect 404 /" that
   we used to replace with "DocumentRoot /var/www/html", so instead of a generic 404 a user
   coming to the web node would get a "Service not available" page.  The DocumentRoot is
   redundant since it is specified in the top-level Apache config.  NOTE:  The new rewrite
   actually causes a rewrite loop.  I tried to find a fix to submit back to drupal.org but
   it's a hard problem and decided not to put time into something we don't need, since we
   don't need a 404-style rewrite or the LetsEncrypt stuff. 

subdir.tpl.php.patch:
 * Replace 'Deny from all' with 'Require all denied'.

vhost.tpl.php.patch:
 * Prefix 'ServerName' with 'https' so that 'mod_shib' will build HTTPS-based URLs.
   This is the documented method for handling SSL-offloading such as we're using.
 * Remove the old Apache 2.2 'Deny from all' directive and replace with 'Require all denied.

vhost_disabled.tpl.php.patch:
  * Replaced the redirection rewrite URL with a hard-coded rewrite to our 404 page.

All other patches:
 * The patch files also replace the Apache 2.2 access directives with the new ones 
required for Apache 2.4.

The original Aegir core files are in ./original.

Changes:

10/16/17 - 
The 'server.tpl.php' file changed for version 7.x-3.12.1.  The patch is the same but was updated
for the new source file.

02/19/18 -
I'm leaving the original <VirtualHost> template unchanged and simply duplicating it for port
443 now.

04/10/18 -
It turns out that the rewrite rule is broken and causes a rewrite loop, as well as having the
undesired behavior of a blanket 404...we've always removed the old 404 redirect.  So just
remove the rewrite now.

07/27/18 -
 - Update for 3.15.1 to remove the 443 vhost config additions.  We no longer need this, 
   since all traffic comes in via port 80 and is flagged to be treated as HTTPS traffic
   by the HTTPS Apache environment variable.

08/10/18 -
 - Updated 'vhost.tpl.php' patch to include prefixing the 'ServerName' with 'https' 
   so that 'mod_shib' will build endpoints that are for HTTPS.

03/18/19
 - Added patch for 'vhost_disabled.tpl.php'.

03/28/19
 - 'platform.tpl.php' now has 'Satisfy All' instead of 'Satisfy Any'.  Changed patch
   for this.
 - 'subdir.tpl.php' changed outside of the patch range but complained.  Made new.
 - 'vhost.tpl.php' changed outside of the patch range but complained.  Made new.
   Also put back the 'Require all denied' instead of just deleting 'Deny from all'.
   Just removing was an oops from the upgrade to Aegir 3.15.1.
   patch.
 - 'vhost_disabled.tpl.php' changed outside of patch range but complained.  Made new.


Application
===========

* To apply:

cd /var/aegir/.drush/provision/http/Provision/Config/Apache
patch < /var/aegir/aegir_patches/apache_config_template_mods/platform.tpl.php.patch
patch < /var/aegir/aegir_patches/apache_config_template_mods/server.tpl.php.patch
patch < /var/aegir/aegir_patches/apache_config_template_mods/subdir.tpl.php.patch
patch < /var/aegir/aegir_patches/apache_config_template_mods/vhost.tpl.php.patch
patch < /var/aegir/aegir_patches/apache_config_template_mods/vhost_disabled.tpl.php.patch
