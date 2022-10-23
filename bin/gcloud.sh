#!/bin/bash -e

plugins=(
  gke-gcloud-auth-plugin
)

echo -e "\n🏃 Running gcloud install plugins..."
for plugin in "${plugins[@]}"; do
  gcloud components install ${plugin}
  ${plugin} --version
done

gcloud components update
gcloud components list
