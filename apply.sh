CMD_DIR=$PWD

cd $CMD_DIR/apache_config_template_mods
sh apply.sh

cd $CMD_DIR/bypass_site_rsync
sh apply.sh

cd $CMD_DIR/hosting_package_mods
sh apply.sh

#cd $CMD_DIR/hosting_queued
#sh apply.sh

cd $CMD_DIR/hosting_site_backup_manager
sh apply.sh

cd $CMD_DIR/hosting_site_mods
sh apply.sh

cd $CMD_DIR/hosting_task_mods
sh apply.sh

cd $CMD_DIR/provision_config_mods
sh apply.sh

cd $CMD_DIR/provision_db_mods
sh apply.sh

cd $CMD_DIR/provision_pack_mods
sh apply.sh

cd $CMD_DIR/reorder_ops_db
sh apply.sh
