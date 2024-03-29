#!/usr/bin/env bash

set -eo pipefail

diff_files() {
    extension="$1"
    
    git diff --diff-filter=d --name-only --staged | grep -e "\(.*\).$extension$"
}

## Shell

read -r -a shell_files <<< "$(diff_files 'sh')"

if [ "${#shell_files[@]}" -gt 0 ]; then
    shellcheck "${shell_files[@]}"
fi

## Swift

read -r -a swift_files <<< "$(diff_files 'swift')"

if [ "${#swift_files[@]}" -gt 0 ]; then
    swiftformat format "${swift_files[@]}"
    swiftlint lint --fix --strict "${swift_files[@]}"
fi
