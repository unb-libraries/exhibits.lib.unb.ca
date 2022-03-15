#!/usr/bin/env sh
set -e

mkdir /tmp/modules
cd /tmp/modules

# Mapping.
curl -OL https://github.com/omeka-s-modules/Mapping/releases/download/v1.5.0/Mapping-1.5.0.zip
unzip Mapping-1.5.0.zip
$RSYNC_MOVE Mapping "$APP_WEBROOT/modules/"

rm -rf /tmp/modules
