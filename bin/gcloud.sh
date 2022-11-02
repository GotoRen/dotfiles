#!/bin/bash -e

plugins=(
  gke-gcloud-auth-plugin
  config-connector
)

echo "🏃 Running gcloud install plugins..."
for plugin in "${plugins[@]}"; do
  gcloud components install ${plugin}
  ${plugin} --version
done

gcloud beta resource-config -h

gcloud components update
gcloud components list
