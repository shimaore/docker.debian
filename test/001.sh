#!/bin/bash

docker run --rm=true shimaore/debian /bin/bash <<'EOF' && echo OK
  [ -x /etc/resolv.conf ] || exit 1
  [ -x /etc/apt/sources.list ] || exit 1
  [ -x /etc/hostname ] || exit 1
  [ -x /etc/passwd ] || exit 1
  [ -x /etc/debian_version ] || exit 1
EOF
