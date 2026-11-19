FROM ghcr.io/unb-libraries/nginx-php:3.24.x

ARG OMEKA_VERSION=4.2.1

ENV OMEKA_ARCHIVE_FILE="omeka-s-${OMEKA_VERSION}.zip"
ENV OMEKA_DOWNLOAD_URL="https://github.com/omeka/omeka-s/releases/download/v${OMEKA_VERSION}/${OMEKA_ARCHIVE_FILE}"
ENV OMEKA_INSTALLED_MARKER="${APP_WEBROOT}/files/.omeka_installed"
ENV SITE_URI="exhibits.lib.unb.ca"

COPY build /build

RUN apk --no-cache add \
    imagemagick \
    mysql-client \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-pdo_mysql \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-xmlwriter && \
  curl -sSL -o "/tmp/${OMEKA_ARCHIVE_FILE}" "${OMEKA_DOWNLOAD_URL}" && \
  unzip -q "/tmp/${OMEKA_ARCHIVE_FILE}" -d /tmp && \
  rm -f "/tmp/${OMEKA_ARCHIVE_FILE}" && \
  ${RSYNC_MOVE} /tmp/omeka-s/ "${APP_WEBROOT}/" && \
  rm -rf /tmp/omeka-s && \
  ${RSYNC_MOVE} /build/config/ "${APP_WEBROOT}/config/" && \
  ${RSYNC_MOVE} /build/package-conf/nginx/app.conf "${NGINX_APP_CONF_FILE}" && \
  ${RSYNC_MOVE} /build/package-conf/nginx/daemon/ "${NGINX_CONFD_DIR}/daemon/" && \
  ${RSYNC_MOVE} /build/package-conf/php/conf.d/omeka.ini "${PHP_CONFD_DIR}/zz_omeka.ini" && \
  ${RSYNC_MOVE} /build/scripts/ /scripts/ && \
  chmod -R 755 /scripts && \
  /scripts/installModules.sh && \
  /scripts/installThemes.sh

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="omeka" \
      org.opencontainers.image.title="exhibits.lib.unb.ca" \
      org.opencontainers.image.description="exhibits.lib.unb.ca provides moderate scale digital exhibits at UNB Libraries." \
      org.opencontainers.image.vendor="University of New Brunswick Libraries" \
      org.opencontainers.image.authors="UNB Libraries <libsupport@unb.ca>" \
      org.opencontainers.image.url="https://exhibits.lib.unb.ca" \
      org.opencontainers.image.source="https://github.com/unb-libraries/exhibits.lib.unb.ca" \
      org.opencontainers.image.version="$VERSION" \
      org.opencontainers.image.revision="$VCS_REF" \
      org.opencontainers.image.created="$BUILD_DATE"
