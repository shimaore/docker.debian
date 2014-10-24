#!/bin/bash
set -e

DATE=`/bin/date -u '+%Y%m%d-%H%M%S'`
# TMPDIR=./mkimage ./mkimage.sh -t "shimaore/debian:$DATE" debootstrap --variant=minbase testing http://debian.shimaore.net/debian
TMPDIR=./mkimage ./mkimage.sh -t "shimaore/debian:$DATE" debootstrap --variant=minbase testing http://ftp.fr.debian.org/debian

docker tag "shimaore/debian:$DATE" shimaore/debian:latest

echo Tests
for test in test/*; do "$test"; done
