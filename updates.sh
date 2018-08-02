#!/bin/bash

start_time="$(date +%s)"
uptime="$(uptime)"
freemem="$(free -m)"
freedisk="$(df -h | grep '/'|sort -nr -k5)"
docroots="$(cat /etc/httpd/conf.d/*.conf |grep DocumentRoot | grep -v '#'|awk '{print $2}'|sort |uniq)"
#docroots2="$(sudo /usr/sbin/httpd -S | /bin/egrep "(namevhost|:80)" |awk '{print $4}' )"
#docroots3="$(/bin/grep -v "#" $docroots  | /bin/grep -io "DocumentRoot.*" | /bin/cut -d " " -f2 | /usr/bin/uniq)"

echo "Uptime:"
echo "$uptime"
echo
echo "Free Memory:"
echo "$freemem"
echo
echo "Disk Space:"
echo "$freedisk"
echo
echo "Docroots found in /etc/httpd/conf.d/*.conf:"
echo "$docroots"
echo
echo
for docroot in $docroots; do echo; cd $docroot ; echo $(pwd) ;wp core version  --allow-root 2>/dev/null; wp plugin list --allow-root 2>/dev/null | grep -i 'available' ; wp theme list --allow-root 2>/dev/null | grep -i 'available' ; drush status | grep -i 'Drupal version';drush up --security-only -n | grep -i 'secur'; done

finish_time="$(date +%s)"

echo "Time duration: $((finish_time - start_time)) secs."
