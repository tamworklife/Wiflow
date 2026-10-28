# WiFlow · Viettel NR3053

Workspace for the WiFlow firmware and custom LuCI interface for the Viettel NR3053.

## Current progress
- UI design prototype: `ui-prototype/` (visual-only, mock data).
- LuCI style package source: `package/wiflow-luci-style/`.
- Package builder: `tools/build-style-ipk.sh`.

The style package adds a responsive CSS layer to supported existing LuCI templates and does not replace the router's wireless handlers. It is not the completed custom dashboard or Wi-Fi wizard.

## Firmware status
A modified sysupgrade image has **not** yet been built or validated. The original SquashFS could not be extracted in the current environment because compatible extraction tools are unavailable and network resolution is blocked. Do not flash the prototype or style package as a firmware image.

See [implementation status](docs/IMPLEMENTATION_STATUS.md) for the exact blocker and the steps required to complete the firmware.
