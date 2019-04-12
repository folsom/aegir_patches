Overview
========

File location:  /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/queued
File patched :  hosting-queued.service.example
Aegir version:  3.15.1
Date Created :  07/16/18
Date Updated :  

This isn't a patch of an existing file but instead a new file.  It's an example of a systemd unit file
for the hosting queued daemon.  The stock module only includes the old style sysV init script example.

Changes:


Application
==========

# Enable module 'hosting_queued' from the Aegir front-end.  This will disable to
# cron-based hosting queue runner.

# As aegir user
cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/queued
cp /var/aegir/aegir_patches/hosting_queued/hosting-queues.service.example .

# As root
cd /etc/systemd/system
cp /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/queued/hosting-queued.service. hosting-queued.service
systemctl daemon-reload
systemctl enable hosting-queued
systemctl start hosting-queued
