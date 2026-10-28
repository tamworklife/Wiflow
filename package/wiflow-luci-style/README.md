# WiFlow LuCI style package

Presentation-only CSS layer for existing LuCI pages. It does not implement the custom three-page dashboard or Wi-Fi wizard yet, and does not replace wireless configuration handlers.

Build inside a matching OpenWrt build tree after placing this directory under the package feed:

```sh
make package/wiflow-luci-style/compile V=s
```

The first-boot hook backs up each supported Lua/ucode header template to `*.wiflow-original` before injecting the CSS reference. Remove the inserted link and restore those backup files to roll back.
