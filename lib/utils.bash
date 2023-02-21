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
