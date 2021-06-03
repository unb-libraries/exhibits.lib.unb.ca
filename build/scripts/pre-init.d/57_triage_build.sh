#!/usr/bin/env sh
# Triage the build to determine how to deploy.

# Remove old file markers to eliminate false positives
rm -rf /tmp/OMEKA_DB_LIVE
rm -rf /tmp/OMEKA_FILES_LIVE

# Check if the database has tables named *api_key*. If so, this is likely a live DB.
RESULT=$(mysqlshow -h ${MYSQL_HOSTNAME} -P ${MYSQL_PORT} --user=root --password=$MYSQL_ROOT_PASSWORD ${MYSQL_DATABASE} | grep api_key)
if [ -n "$RESULT" ]; then
  touch /tmp/OMEKA_DB_LIVE
  echo "Triage : Found Omeka Database."
fi

# Determine if the site was previously built by checking the files dir.
if [ -f ${OMEKA_INSTALLED_MARKER} ]; then
  touch /tmp/OMEKA_FILES_LIVE
  echo "Triage : Found Installed Omeka Filesystem."
fi
