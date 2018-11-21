#!/bin/bash

# quick script to make a fresh changes file to upload to PPA


# deps
add-apt-repository ppa:canonical-bootstack/thruk
apt-get update
apt-get install libthruk debhelper lsb-release bc devscripts libfile-slurp-perl libdate-calc-perl libcss-compressor-perl libthruk libcpanel-json-xs-perl libmodule-install-perl


./configure --with-httpd-conf /etc/apache2/conf-available
perl Makefile.PL
make
make dist
dch -i
debuild -us -uc -S

echo "Now go and debsign the .changes, and dput it"
