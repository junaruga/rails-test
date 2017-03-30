#!/bin/bash -ex
# shellcheck disable=SC2039

# pushd "$(dirname "${0}")/.." > /dev/null
# ROOT_DIR=$(pwd)
# popd > /dev/null

if [ "${#}" -ne 1 ]; then
    cat << EOF 1>&2
Usage: ${0} RAILS_VERSION_DIR

Arguments
  - RAILS_VERSION_DIR: rails/RAILS_VERSION
EOF
    exit 1
fi

VERSION_DIR="${1}"
FILES="
    ${VERSION_DIR}/app/bundle_list.txt
    ${VERSION_DIR}/app/Gemfile
    ${VERSION_DIR}/app/Gemfile.lock
    ${VERSION_DIR}/bundle_list.txt
    ${VERSION_DIR}/Gemfile
    ${VERSION_DIR}/Gemfile.lock
"

for FILE in ${FILES}; do
    git add "${FILE}"
done

exit 0
