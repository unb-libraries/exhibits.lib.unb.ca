#!/usr/bin/env sh

# Configure omeka to show debug messages in local.
sed -i "s|APPLICATION_ENV local|APPLICATION_ENV development|g" "$NGINX_APP_CONF_FILE"
