#!/bin/bash

if docker inspect scratch > /dev/null; then
  echo "Using existing scratch image";
else
  # scratch.tar is a tar file containing
  #   drwxr-xr-x root/root         0 2014-09-11 19:51 ./
  docker import - scratch < scratch.tar
fi

DATE=`/bin/date -u '+%Y%m%d-%H%M%S'`
TMPDIR=./mkimage ./mkimage.sh -t "shimaore/debian:$DATE" debootstrap --variant=minbase testing http://debian.shimaore.net:9999/debian
