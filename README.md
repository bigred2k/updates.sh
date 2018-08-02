This is a WIP script to detect Apache docroots and then check those docroots for outstanding CMS updates




Unimplemented:

uptime:
Free memory:
Disk space:


search for docroots and label them as wordpress or drupal
if wordpress:
run 
wp core version  --allow-root 
wp plugin list --allow-root |grep available
wp theme list --allow-root |grep available

if drupal run:
drush status
drush 
drush rq --severity ?
