#!/usr/bin/env bash

set -o errexit
set -o pipefail

check_prereq() {
  if ! command -v $1 &> /dev/null
  then
    echo "[check_prereq] '$1' is required; please install it before running this command."
    exit
  fi
}

download_current_versions_list() {
  local src_url="https://downloads.mongodb.org/current.json"
  if [ -z "$current_versions_list" ]; then
    current_versions_list=$(curl -# -L 2> /dev/null $src_url)
  fi
}

download_full_versions_list() {
  local src_url="https://downloads.mongodb.org/full.json"

  if [ -z "$full_versions_list" ]; then
    full_versions_list=$(curl -# -L 2> /dev/null $src_url)
  fi
} 
