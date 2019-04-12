Overview
========

File patched :  db.php
Aegir version:  3.12.1
Date Created :  02/14/17
Last modified:  10/17/17

This patch moves the creation of a website database to before the creation of database user accounts and
the deletion of a database to after the user accounts are deleted.  Since moving to central database servers using
a master/slave set-up, the slave sometimes errors out when trying to carry out the operations when the database
is created after accounts are or deleted before accounts are.  

The original Aegir core file is in ./original.

Changes
=======

10/17/17:
'db.php' changed a bit, so the changes needed to be integrated into
the new source file and the patch generated from this.

Application
==========

cd /var/aegir/.drush/provision/db/Provision/Service/
patch < /var/aegir/aegir_patches/reorder_ops_db/db.php.patch
