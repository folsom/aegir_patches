Overview
========

File locations:  /var/aegir/.drush/provision/http/Provision/Service/http
                 /var/aegir/.drush/provision/Provision/Context
Files patched :  pack.php
                 server.php
Aegir version :  3.15.1
Date updated  :  02/15/19

These two patches add a get_services_types() to the Provision_Context_server 
class in server.php, which is inherited and used in the class Provision_Service_http_pack 
in pack.php.  It modifies the class such that a check on web server services includes
all defined services on the server and not just http.

The original Aegir core file is in ./original.

Changes
=======

02/21/17  The patch for pack.php now has a fix for an Aegir bug where a
          variable named $config has an extra "i" on it and is now $configi.
          This is corrected and has been submitted as bug to the support
          community.

10/17/17  The patch for the extra "i" is included in the 3.12.1 code and
          has been removed here.

02/15/19  The 'server.php' patch now also exits the 'sync()' function without doing 
          anything if the file path to be synced is for a web cluster, indicating 
          that it's an NFS mount and doesn't need to be synced.

Application
===========

Pack service patch:

cd /var/aegir/.drush/provision/http/Provision/Service/http
patch < /var/aegir/aegir_patches/provision_pack_mods/pack.php.patch

Provision Context patch:

cd /var/aegir/.drush/provision/Provision/Context
patch < /var/aegir/aegir_patches/provision_pack_mods/server.php.patch
