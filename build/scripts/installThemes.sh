#!/usr/bin/env sh
set -e

mkdir /tmp/themes
cd /tmp/themes

# centerrow.
curl -OL https://github.com/omeka-s-themes/centerrow/releases/download/v1.7.2/theme-centerrow-v1.7.2.zip
unzip theme-centerrow-v1.7.2.zip
$RSYNC_MOVE centerrow "$APP_WEBROOT/themes/"

# cozy.
curl -OL https://github.com/omeka-s-themes/cozy/releases/download/v1.5.2/theme-cozy-v1.5.2.zip
unzip theme-cozy-v1.5.2.zip
$RSYNC_MOVE cozy "$APP_WEBROOT/themes/"

# foundation-s.
curl -OL https://github.com/omeka-s-themes/foundation-s/releases/download/v1.2.3/theme-foundation-s-v1.2.3.zip
unzip theme-foundation-s-v1.2.3.zip
$RSYNC_MOVE foundation "$APP_WEBROOT/themes/"

# papers.
curl -OL https://github.com/omeka-s-themes/papers/releases/download/v1.3.2/theme-papers-v1.3.2.zip
unzip theme-papers-v1.3.2.zip
$RSYNC_MOVE papers "$APP_WEBROOT/themes/"

# thanksroy.
curl -OL https://github.com/omeka-s-themes/thanksroy/releases/download/v1.0.1/theme-thanksroy-v1.0.1.zip
unzip theme-thanksroy-v1.0.1.zip
$RSYNC_MOVE thanksroy "$APP_WEBROOT/themes/"

# thedaily.
curl -OL https://github.com/omeka-s-themes/thedaily/releases/download/v1.6.2/theme-thedaily-v1.6.2.zip
unzip theme-thedaily-v1.6.2.zip
$RSYNC_MOVE thedaily "$APP_WEBROOT/themes/"

rm -rf /tmp/themes
