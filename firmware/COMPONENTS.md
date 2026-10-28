# Firmware component inventory

The working session contains these extracted binary components from the supplied image:

- `kernel.gz` — compressed Linux kernel image
- `nr3053.dtb` — device tree blob for NR3053
- `rootfs.squashfs` — compiled SquashFS root filesystem

The original sysupgrade image is approximately 18.2 MB. The root filesystem is approximately 11.95 MB.

These are binary firmware components, not a complete editable OpenWrt source tree. The image and component binaries are not currently committed here. Before uploading them, decide whether binary firmware artifacts should live in this repository or in GitHub Releases/LFS, and verify redistribution rights.
