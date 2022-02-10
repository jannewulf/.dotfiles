#!/bin/bash

if ! which dpkg-architecture > /dev/null; then
  echo "dpkg-architecture was not found. Install package 'dpkg-dev' first" > /dev/stderr
  exit 1
fi

if ! which jq > /dev/null; then
  echo "jq was not found. Install it first" > /dev/stderr
  exit 1
fi

system_type=$(dpkg-architecture -q DEB_BUILD_ARCH)
deb_link=$(
  wget -qO- https://api.github.com/repos/dandavison/delta/releases/latest | \
  jq -r ".assets[] | select(.name | match(\"git-delta_.*_${system_type}.deb\")) | .browser_download_url"
)

if [ -z $deb_link ]; then
  echo "Cannot find debian package for architecture '${system_type}'" > /dev/stderr
  exit 1
fi

tmp_dir=$(mktemp -d)
mkdir -p $tmp_dir
deb_file=${tmp_dir}/$(basename $deb_link)

wget -q $deb_link -O $deb_file && \
sudo dpkg -i $deb_file

rm -rf $tmp_dir

