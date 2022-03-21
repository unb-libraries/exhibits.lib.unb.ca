#!/usr/bin/env sh
set -e

mkdir /tmp/modules
cd /tmp/modules

# Mapping.
curl -OL https://github.com/omeka-s-modules/Mapping/releases/download/v1.5.0/Mapping-1.5.0.zip
unzip Mapping-1.5.0.zip
$RSYNC_MOVE Mapping "$APP_WEBROOT/modules/"

# Collecting.
curl -OL https://github.com/omeka-s-modules/Collecting/releases/download/v1.8.0/Collecting-1.8.0.zip
unzip Collecting-1.8.0.zip
$RSYNC_MOVE Collecting "$APP_WEBROOT/modules/"

rm -rf /tmp/modules
