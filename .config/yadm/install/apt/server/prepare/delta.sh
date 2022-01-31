#!/bin/bash

binary_link_local=$(curl -sSL https://github.com/dandavison/delta/releases/latest | \
  grep -E -o "href=\".*git-delta_.+_$(dpkg-architecture -q DEB_BUILD_ARCH)\.deb\"" | \
  cut -d '"' -f 2)
binary_link=https://github.com${binary_link_local}
deb_file=/tmp/$(basename $binary_link)

curl -sSL $binary_link -o $deb_file && \
sudo dpkg -i $deb_file

rm -f $deb_file

