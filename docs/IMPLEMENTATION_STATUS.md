# Firmware UI implementation status

## Confirmed target

- Firmware supplied: `wiflow-os-1.4.0-viettel-nr3053-squashfs-sysupgrade.itb`
- Target: Viettel NR3053 / WiFlow
- UX target: three primary LuCI sections (Tổng quan, WiFi, Hệ thống), responsive desktop/tablet/mobile layout, WiFlow brand styling, rounded favicon with transparent outside corners.
- Wi-Fi wizard must preserve every original LuCI operation and order. The first custom-styled step selects the existing MediaTek 2.4 GHz or 5 GHz radio for scanning; then show scan results, select SSID, enter password, continue, save, save & apply, and completion only where those correspond to the original LuCI flow.

## Safety gate before firmware changes

The repository still does not contain a verified OpenWrt build tree, package feed revisions, target patches, or the original LuCI handlers. The supplied ITB contains a SquashFS root filesystem, but this environment currently has no `unsquashfs`/SquashFS extraction utility and package installation is unavailable. The image's SquashFS payload has been located and copied for later extraction; it has not been modified.

Do not create or label a modified image as flashable until:
1. the rootfs and existing LuCI files are extracted and inspected;
2. the current scan/connect/save/apply handlers and MediaTek radio identifiers are verified;
3. the UI changes are applied without replacing backend behavior;
4. responsive layout and the full wizard are tested;
5. the image is rebuilt with the correct target toolchain and validated.

## Prototype

See `ui-prototype/`. It is visual-only, uses mock status/network values, and does not call router APIs. It is a design reference, not firmware code.
