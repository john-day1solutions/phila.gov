#!/bin/bash
#
# Install private plugins

source /home/ubuntu/.ssh/environment

_dir="$(dirname "$0")"
plugins="meta-box-group-1.1.1.zip meta-box-include-exclude-1.0.3.zip meta-box-conditional-logic-1.3.0.zip wpfront-user-role-editor-personal-pro-2.12.5.zip wp-super-cache.1.4.8.zip"

cd /home/ubuntu/app/wp
for plugin in $plugins; do
  #wp plugin install --quiet --force --activate "$("$_dir/s3url.sh" "$PHILA_PLUGIN_BUCKET" "$plugin")" > /dev/null
  echo "--- Installing $plugin ---"
  wp plugin install --force --activate "$("$_dir/s3url.sh" "$PHILA_PLUGIN_BUCKET" "$plugin")"
done
