#!/bin/bash

DATE=`/bin/date -u '+%Y%m%d-%H%M%S'`
TMPDIR=./mkimage ./mkimage.sh -t "shimaore/debian:$DATE" debootstrap --variant=minbase testing http://debian.shimaore.net:9999/debian

docker tag "shimaore/debian:$DATE" shimaore/debian:latest
