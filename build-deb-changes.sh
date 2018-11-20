#!/bin/bash

# quick script to make a fresh changes file to upload to PPA

./configure --with-httpd-conf /etc/apache2/conf-available
perl Makefile.PL
make
make dist
dch -i
debuild -us -uc -S

echo "Now go and debsign the .changes, and dput it"
