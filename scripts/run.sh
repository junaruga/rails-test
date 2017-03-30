#!/bin/bash -ex
# shellcheck disable=SC2039

pushd "$(dirname "${0}")/.." > /dev/null
ROOT_DIR=$(pwd)
popd > /dev/null

RAILS_DIR="${ROOT_DIR}/rails"
GEMFILE_TEMPLATE_FILE="${ROOT_DIR}/scripts/Gemfile.template"

if [ "${#}" -ne 1 ]; then
    cat << EOF 1>&2
Usage: ${0} RAILS_VERSION

Arguments
  - RAILS_VERSION: ex. "5.0.1", "5.1.0.rc1"
EOF
    exit 1
fi

VERSION=${1}
VERSION_DIR="${RAILS_DIR}/${VERSION}"
if [ -d "${VERSION_DIR}" ]; then
    rm -rf "${VERSION_DIR}"
fi
mkdir -p "${VERSION_DIR}"

pushd "${VERSION_DIR}"
sed "s/%%VERSION%%/${VERSION}/" "${GEMFILE_TEMPLATE_FILE}" > Gemfile
bundle install --path vendor/bundle
bundle list > bundle_list.txt
bundle exec rails -v
bundle exec rails new app --skip-bundle

pushd app
bundle install --path vendor/bundle
bundle list > bundle_list.txt
popd

popd

echo "Done successfully."
exit 0
