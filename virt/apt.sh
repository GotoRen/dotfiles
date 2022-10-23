#!/bin/bash -e

SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

apt update && apt upgrade -y

while read line; do
  DEBIAN_FRONTEND=noninteractive apt install $line -y
done <${SCRIPT_DIR}/Aptfile

apt list --installed
