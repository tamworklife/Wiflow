#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PKG="$ROOT/package/wiflow-luci-style"
OUT=${1:-"$ROOT/build"}
STAGE=$(mktemp -d)
trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$OUT" "$STAGE/control" "$STAGE/data/www/luci-static/resources" "$STAGE/data/usr/share/wiflow" "$STAGE/data/etc/uci-defaults"
cp "$PKG/htdocs/wiflow.css" "$STAGE/data/www/luci-static/resources/wiflow.css"
cp "$PKG/htdocs/wiflow-favicon.png" "$STAGE/data/www/luci-static/resources/wiflow-favicon.png"
cp "$PKG/htdocs/wiflow-favicon.png" "$STAGE/data/usr/share/wiflow/favicon.png"
cp "$PKG/root/etc/uci-defaults/99-wiflow-style" "$STAGE/data/etc/uci-defaults/99-wiflow-style"
chmod 755 "$STAGE/data/etc/uci-defaults/99-wiflow-style"
cat > "$STAGE/control/control" <<'CONTROL'
Package: wiflow-luci-style
Version: 1.0.0-1
Architecture: all
Section: luci
Priority: optional
Depends: luci-base
Maintainer: WiFlow
Description: Responsive WiFlow visual styling for existing LuCI pages.
 This package adds a presentation-only CSS layer and preserves existing LuCI handlers.
CONTROL
printf '2.0\n' > "$STAGE/debian-binary"
(cd "$STAGE/control" && tar --numeric-owner --owner=0 --group=0 -czf "$STAGE/control.tar.gz" ./control)
(cd "$STAGE/data" && tar --numeric-owner --owner=0 --group=0 -czf "$STAGE/data.tar.gz" .)
IPK="$OUT/wiflow-luci-style_1.0.0-1_all.ipk"
rm -f "$IPK"
(cd "$STAGE" && ar cr "$IPK" debian-binary control.tar.gz data.tar.gz)
echo "$IPK"
