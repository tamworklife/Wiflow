# WiFlow UI prototype

Responsive, interactive visual prototype for the three-page WiFlow layout and the intended six-step LuCI Wi-Fi connection flow.

**Important:** this is a design prototype, not a live LuCI implementation. Status values and scan results are mock data; controls do not call OpenWrt RPC/ubus or save router configuration.

Open `index.html` in a browser to review desktop, tablet, and mobile breakpoints. The favicon assets are in `../assets/`.

Before integrating into the NR3053 firmware, map each visual step to the existing LuCI handlers and verify the actual MediaTek radio/device identifiers. Do not replace underlying scan/connect/save/apply logic with prototype JavaScript.
