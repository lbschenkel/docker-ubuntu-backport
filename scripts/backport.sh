#!/bin/sh
set -e
set -x

PKG=$1

backportpackage --dont-sign -w /tmp -b $PKG
cp /tmp/buildresult/*.deb /deb/

