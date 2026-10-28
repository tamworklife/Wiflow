# Firmware source recovery

The provided `.itb` is a compiled OpenWrt sysupgrade image, not an original source checkout. Its SquashFS root filesystem contains compiled executables, scripts, LuCI files, configuration, and package artifacts. Recovering those files is not the same as recovering the original OpenWrt build tree.

## Required next steps

1. Extract the SquashFS filesystem from `firmware/rootfs.squashfs` using a compatible `unsquashfs` tool.
2. Inventory `/www/luci-static/`, `/usr/lib/lua/luci/`, `/usr/share/ucode/`, `/etc/config/`, and installed package metadata.
3. Identify the custom WiFlow theme and Wi-Fi scan/connect handlers.
4. Copy only relevant source-like files into this repository, preserving paths and recording provenance.
5. Recover the matching OpenWrt source revision, target profile, package feeds, and patches before attempting a reproducible build.

## Important distinction

Do not claim the original source tree has been recovered until the actual source files and build metadata are present and verified. Never commit Wi-Fi passwords, private keys, or personal configuration backups.
