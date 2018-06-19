#!/bin/sh

# Following https://fedoraproject.org/wiki/Changes/Ruby_on_Rails_5.2
# How To Test section

# To test Rails from upstream

# To test only Rails itself

# To test the complete feature including generating a new Rails app using RPM

set -e

mock -r fedora-rawhide-x86_64 --scrub=all
mock -r fedora-rawhide-x86_64 --dnf-cmd group install 'Ruby on Rails'

# Temporary
mock -r fedora-rawhide-x86_64 -i curl
mock -r fedora-rawhide-x86_64 -i rubygem-bootsnap
mock -r fedora-rawhide-x86_64 -i rubygem-mini_magick

mock -r fedora-rawhide-x86_64 --shell "
set -xe
mkdir work
cd work
rails new app --skip-bundle
cd app
sed -i '/chromedriver-helper/ s/^/#/' Gemfile
rails s &
sleep 5
curl -fsSL http://0.0.0.0:3000
echo OK
"
