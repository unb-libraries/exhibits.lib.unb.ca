#!/usr/bin/env sh

if [ ! -f /tmp/OMEKA_DB_LIVE ] && [ ! -f /tmp/OMEKA_FILES_LIVE ];
then
  # Bring up temporary nginx to install local omeka-s
  nginx &
  sleep 5

  curl -X POST \
    --silent \
    -F "user[email]=$OMEKA_ADMIN_EMAIL" \
    -F "user[email-confirm]=$OMEKA_ADMIN_EMAIL" \
    -F "user[name]=$OMEKA_ADMIN_NAME" \
    -F "user[password-confirm][password]=$OMEKA_ADMIN_PASSWORD" \
    -F "user[password-confirm][password-confirm]=$OMEKA_ADMIN_PASSWORD" \
    -F "settings[installation_title]=Omeka" \
    -F "settings[time_zone]=UTC" \
    -F "settings[locale]=" \
    http://localhost/install

  # Stop temporary nginx
  nginx -s stop
  sleep 5

  # Set installed marker.
  touch "${OMEKA_INSTALLED_MARKER}"
fi
