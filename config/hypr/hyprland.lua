-- Hyprland Lua entrypoint — vanilla Hyprland config (lua format, 0.55+).
--
-- Each require() runs in an isolated lua scope — a syntax/runtime error in one
-- file won't stop the others from loading. See
-- https://wiki.hypr.land/Configuring/Start/

require("lua.monitors")
require("lua.env")
require("lua.autostart")
require("lua.input")
require("lua.general")
require("lua.decoration")
require("lua.animations")
require("lua.misc")
require("lua.windowrules")
require("lua.keybinds")

-- scrolling.lua exists but is opt-in. Uncomment to enable the scrolling layout
-- for workspace 3.
-- require("lua.scrolling")
