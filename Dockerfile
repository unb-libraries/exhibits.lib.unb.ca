FROM ghcr.io/unb-libraries/nginx-php:1.x-7.x
MAINTAINER UNB Libraries Systems <libsystems_at_unb.ca>

ARG OMEKA_VERSION=3.1.2

ENV OMEKA_ARCHIVE_FILE omeka-s-${OMEKA_VERSION}.zip
ENV OMEKA_DOWNLOAD_URL https://github.com/omeka/omeka-s/releases/download/v${OMEKA_VERSION}/${OMEKA_ARCHIVE_FILE}
ENV OMEKA_INSTALLED_MARKER ${APP_WEBROOT}/files/.omeka_installed
ENV SITE_URI exhibits.lib.unb.ca

ENV RSYNC_FLAGS --quiet
ENV RSYNC_COPY "rsync -a --inplace --no-compress ${RSYNC_FLAGS}"
ENV RSYNC_MOVE "${RSYNC_COPY} --remove-source-files"

COPY build /build

RUN apk --no-cache add \
    imagemagick \
    mysql-client \
    php-dom \
    php-ctype \
    php-fileinfo \
    php-mbstring \
    php-pdo \
    php-pdo_mysql \
    php-session \
    php-tokenizer \
    php-xml \
    php-xmlwriter \
    rsync && \
  curl -LO ${OMEKA_DOWNLOAD_URL} && mv ${OMEKA_ARCHIVE_FILE} /tmp && cd /tmp && unzip -q ${OMEKA_ARCHIVE_FILE} && rm ${OMEKA_ARCHIVE_FILE} && \
  ${RSYNC_MOVE} /tmp/omeka-s/ /app/html/ && \
  ${RSYNC_MOVE} /build/config/ /app/html/config/ && \
  ${RSYNC_MOVE} /build/package-conf/nginx/ /etc/nginx/conf.d/ && \
  ${RSYNC_MOVE} /build/package-conf/php/conf.d/ /etc/php7/conf.d/ && \
  ${RSYNC_MOVE} /build/scripts/ /scripts/


# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="omeka" \
      com.microscaling.docker.dockerfile="/Dockerfile" \
      com.microscaling.license="MIT" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.description="exhibits.lib.unb.ca provides moderate scale digital exhibits at UNB Libraries." \
      org.label-schema.name="exhibits.lib.unb.ca" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url="https://exhibits.lib.unb.ca" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/unb-libraries/exhibits.lib.unb.ca" \
      org.label-schema.vendor="University of New Brunswick Libraries" \
      org.label-schema.version=$VERSION \
      org.opencontainers.image.source="https://github.com/unb-libraries/exhibits.lib.unb.ca"
