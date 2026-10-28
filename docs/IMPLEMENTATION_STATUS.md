# Firmware UI implementation status

## Confirmed target
- Original image: `wiflow-os-1.4.0-viettel-nr3053-squashfs-sysupgrade.itb`
- FIT metadata identifies ARM64 OpenWrt, target `viettel_nr3053`, Linux 6.12.94.
- Root filesystem: SquashFS 4.0, XZ-compressed, 11,944,652 bytes, 1,693 inodes.
- Desired UI: three primary sections (Tổng quan, WiFi, Hệ thống), responsive desktop/tablet/mobile layout, exact supplied WiFlow favicon, and a Wi-Fi flow that preserves the existing scan/join/save/apply operations.

## Work added
- `ui-prototype/` is a visual-only prototype and uses mock values; it is not router-connected.
- `package/wiflow-luci-style/` adds a presentation-only stylesheet to supported existing LuCI Lua/ucode theme headers. It does not replace wireless handlers.
- `tools/build-style-ipk.sh` packages that styling as an architecture-independent `.ipk`.
- Package source was committed to the repository.

## Blocker and verification
- This container has no `unsquashfs`, `mksquashfs`, `7z`, or `bsdtar`; it has no usable loop device, and outbound DNS/network resolution fails. Mounting the SquashFS is denied by the container.
- Therefore the actual LuCI handlers, template generation/version, MediaTek radio identifiers, and firmware image build rules have not been verified.
- **No modified sysupgrade firmware has been built or validated.** The style `.ipk` is not a flashable firmware image.

## Required before a complete firmware can be produced
1. Extract the root filesystem with a compatible SquashFS 4.0/XZ tool.
2. Inspect the real LuCI templates and existing wireless scan/join/save/apply handlers.
3. Integrate the three-section UI and radio-select-first scan wizard without changing backend operation order.
4. Build with the matching OpenWrt source/build tree or target ImageBuilder, preserving the NR3053 FIT layout.
5. Verify FIT structure, kernel/rootfs compatibility, image size, and recovery path before flashing.
