#!/usr/bin/env sh
set -e

mkdir /tmp/themes
cd /tmp/themes

install_theme() {
  curl -sSLO "$1"
  unzip -q "$(basename "$1")"
  $RSYNC_MOVE "$2" "$APP_WEBROOT/themes/"
}

install_theme https://github.com/omeka-s-themes/centerrow/releases/download/v1.8.5/centerrow-1.8.5.zip centerrow
install_theme https://github.com/omeka-s-themes/cozy/releases/download/v1.6.3/cozy-1.6.3.zip cozy
install_theme https://github.com/omeka-s-themes/foundation/releases/download/v1.5.4/foundation-1.5.4.zip foundation
install_theme https://github.com/omeka-s-themes/papers/releases/download/v1.4.5/theme-papers-v1.4.5.zip papers
install_theme https://github.com/omeka-s-themes/thanksroy/releases/download/v1.2.2/theme-thanksroy-v1.2.2.zip thanksroy
install_theme https://github.com/omeka-s-themes/thedaily/releases/download/v1.7.1/thedaily-1.7.1.zip thedaily

rm -rf /tmp/themes
