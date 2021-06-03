#!/usr/bin/env sh
sed -i "s|MYSQL_USER|$MYSQL_USER|g" ${APP_WEBROOT}/config/database.ini
sed -i "s|MYSQL_PASSWORD|$MYSQL_PASSWORD|g" ${APP_WEBROOT}/config/database.ini
sed -i "s|MYSQL_DATABASE|$MYSQL_DATABASE|g" ${APP_WEBROOT}/config/database.ini
sed -i "s|MYSQL_HOSTNAME|$MYSQL_HOSTNAME|g" ${APP_WEBROOT}/config/database.ini
sed -i "s|MYSQL_PORT|$MYSQL_PORT|g" ${APP_WEBROOT}/config/database.ini
