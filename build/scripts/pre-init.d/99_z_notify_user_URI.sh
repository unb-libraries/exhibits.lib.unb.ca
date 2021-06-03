#!/usr/bin/env sh
if [ -n "$LOCAL_HOSTNAME" ] && [ -n "$LOCAL_PORT" ]; then
  printf "\nVisit your Omeka instance at:"
  printf "\nhttp://%s:%s" "$LOCAL_HOSTNAME" "$LOCAL_PORT"
  printf "\n"
  printf "\nAdmin Login: %s:%s\n" "$OMEKA_ADMIN_EMAIL" "$OMEKA_ADMIN_PASSWORD"
  printf "\n"
fi
