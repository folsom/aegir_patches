echo 'Appying hosting_task_mods hosting_task.module  patch...'

cd /var/aegir/hostmaster-current/profiles/hostmaster/modules/aegir/hosting/task

cp -p hosting_task.module hosting_task.module.orig
patch < /var/aegir/aegir_patches/hosting_task_mods/hosting_task.module.patch
