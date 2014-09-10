#!/bin/bash
# See also
#   sudo TMPDIR="$PWD" DONT_TOUCH_SOURCES_LIST=true /usr/share/docker.io/contrib/mkimage.sh -t shimaore/debian debootstrap --variant=minbase testing

# This script must be ran as root, both debootstrap and docker.io need it.

MIRROR=debian.shimaore.net:9999
DIST=testing
# Comma-separated list of packages to add to minbase, which includes only essential packages and apt.
EXTRA_PACKAGES=""

DATE=`/bin/date -u '+%Y%m%d-%H%M'`
TMPDIR=`mktemp -d --tmpdir=$PWD`

echo "Using TMPDIR=${TMPDIR}"
[ -d "${TMPDIR}" ] || exit 1

/usr/sbin/debootstrap --arch=amd64 --variant=minbase "${DIST}" "${TMPDIR}" "http://${MIRROR}/debian" || exit 1
exit 0

# Based on mkimage.sh
rm -rf "${TMPDIR}/dev" "${TMPDIR}/proc"

/bin/tar -c -C "${TMPDIR}" . | /usr/bin/docker.io import - "debian-${DIST}:${DATE}"

echo "Removing ${TMPDIR}"
rm -rf "${TMPDIR}"
