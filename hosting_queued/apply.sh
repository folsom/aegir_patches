echo 'Applying bypass site rsync patch'

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
