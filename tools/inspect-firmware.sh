#!/bin/sh
set -eu

IMAGE="${1:-wiflow-os-1.4.0-viettel-nr3053-squashfs-sysupgrade.itb}"
OUT="${2:-recovery}"

if [ ! -f "$IMAGE" ]; then
  echo "ERROR: firmware image not found: $IMAGE" >&2
  echo "Usage: $0 path/to/firmware.itb [output-directory]" >&2
  exit 1
fi

mkdir -p "$OUT"
printf '%s\n' "== Image ==" > "$OUT/inspection.txt"
file "$IMAGE" >> "$OUT/inspection.txt" 2>&1 || true
printf '\n%s\n' "== SHA-256 ==" >> "$OUT/inspection.txt"
sha256sum "$IMAGE" >> "$OUT/inspection.txt" 2>&1 || shasum -a 256 "$IMAGE" >> "$OUT/inspection.txt" 2>&1 || true
printf '\n%s\n' "== Available extraction tools ==" >> "$OUT/inspection.txt"
for tool in dumpimage mkimage binwalk unsquashfs; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '%s: %s\n' "$tool" "$(command -v "$tool")" >> "$OUT/inspection.txt"
  else
    printf '%s: not installed\n' "$tool" >> "$OUT/inspection.txt"
  fi
done

cat "$OUT/inspection.txt"
if ! command -v unsquashfs >/dev/null 2>&1; then
  echo
  echo "SquashFS extraction not run: install squashfs-tools and identify/extract the rootfs component first."
  exit 2
fi

echo
echo "Inspection complete. This helper does not flash or modify the device."
