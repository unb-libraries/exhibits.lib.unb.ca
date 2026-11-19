#!/usr/bin/env sh
set -e

mkdir /tmp/modules
cd /tmp/modules

# Mapping.
curl -sSLO https://github.com/omeka-s-modules/Mapping/releases/download/v2.4.0/Mapping-2.4.0.zip
unzip -q Mapping-2.4.0.zip
$RSYNC_MOVE Mapping "$APP_WEBROOT/modules/"

# Collecting.
curl -sSLO https://github.com/omeka-s-modules/Collecting/releases/download/v1.13.0/Collecting-1.13.0.zip
unzip -q Collecting-1.13.0.zip
$RSYNC_MOVE Collecting "$APP_WEBROOT/modules/"

rm -rf /tmp/modules
