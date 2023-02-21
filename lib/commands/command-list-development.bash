#!/usr/bin/env bash

set -o errexit
set -o pipefail

plugin_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${plugin_dir}/../../lib/utils.bash"

check_prereq "jq"
check_prereq "curl"

download_current_versions_list
echo $current_versions_list \
    | jq -r '
        .versions[] 
        | select(.production_release == false)
        | .version' \
    | sort -u \
    | sort -s -k 2.3n -t - \
    | sort -s -k 1,1n -k 2,2n -k 3,3n -t .
   