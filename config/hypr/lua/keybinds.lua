-- Keybinds — sourced from hyprland.lua
local mod = "SUPER"

-- ─── Window / Session actions ──────────────────────────────────────────
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.kill()) -- SIGKILL active window
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + Delete", hl.dsp.exec_cmd("uwsm stop")) -- clean session shutdown (uwsm-safe)
hl.bind("CTRL + ALT + Q", hl.dsp.global("caelestia:lock"))
hl.bind(mod .. " + Backspace", hl.dsp.global("caelestia:session"))
hl.bind(mod .. " + D", hl.dsp.window.pseudo())
hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"))

-- ─── Launch terminals ──────────────────────────────────────────────────
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + T", hl.dsp.exec_cmd("$HOME/.local/bin/ghostty-toggle"))

-- ─── App shortcuts ─────────────────────────────────────────────────────
hl.bind(mod .. " + M", hl.dsp.exec_cmd("thunderbird", { workspace = "1" }))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox", { workspace = "1" }))
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("brave", { workspace = "3" }))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("/usr/bin/obsidian"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd("io.freetubeapp.FreeTube", { workspace = "4 silent" }))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("com.mastermindzh.tidal-hifi", { workspace = "5 silent" }))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("$HOME/.local/bin/caelestia-explorer"))
hl.bind(mod .. " + A", hl.dsp.exec_cmd("qs -c caelestia ipc call drawers toggle dashboard"))
hl.bind(
    mod .. " + N",
    hl.dsp.exec_cmd(
        [[sh -c 'if pgrep -x hyprsunset >/dev/null; then pkill hyprsunset && notify-send -u low "Night mode OFF"; else hyprsunset -t 4500 & notify-send -u low "Night mode ON (4500K)"; fi']]
    )
)
hl.bind(mod .. " + W", hl.dsp.exec_cmd("qs -c caelestia ipc call drawers toggle sidebar"))
hl.bind(mod .. " + SHIFT + A", hl.dsp.exec_cmd("qs -c caelestia ipc call drawers toggle bar"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("1password --quick-access"))
hl.bind(mod .. " + Super_L", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
hl.bind(mod .. " + Z", hl.dsp.exec_cmd("$HOME/.local/bin/pin-toggle"))
hl.bind(
    mod .. " + X",
    hl.dsp.exec_cmd(
        [[sh -c 'was=$(qs -c caelestia ipc call idleInhibitor isEnabled); qs -c caelestia ipc call idleInhibitor toggle; if [ "$was" = "true" ]; then setsid -f hypridle >/dev/null 2>&1; notify-send -u low -i unlock -h string:x-canonical-private-synchronous:idleinhibit "Idle inhibitor OFF"; else pkill -x hypridle; notify-send -u low -i lock -h string:x-canonical-private-synchronous:idleinhibit "Idle inhibitor ON"; fi']]
    )
)
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("uwsm stop")) -- nuclear: drop to SDDM
hl.bind(mod .. " + U", hl.dsp.exec_cmd("caelestia wallpaper -r"))
hl.bind(mod .. " + I", hl.dsp.exec_cmd("$HOME/.local/bin/caelestia-controlcenter-toggle"))
hl.bind(mod .. " + slash", hl.dsp.exec_cmd("$HOME/.local/bin/binds-help"))
hl.bind(mod .. " + SHIFT + G", hl.dsp.exec_cmd("$HOME/.local/bin/gamelauncher"))

-- ─── Clipboard ─────────────────────────────────────────────────────────
hl.bind(mod .. " + C", hl.dsp.exec_cmd("pgrep -x fuzzel >/dev/null && pkill fuzzel || caelestia clipboard"))

-- ─── Focus (arrows + vim hjkl) ─────────────────────────────────────────
local focus_dirs = { left = "l", right = "r", up = "u", down = "d", H = "l", L = "r", K = "u", J = "d" }
for key, dir in pairs(focus_dirs) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = dir }))
end

-- ─── Move window (vim hjkl) ────────────────────────────────────────────
local move_dirs = { H = "l", L = "r", K = "u", J = "d" }
for key, dir in pairs(move_dirs) do
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end

-- ─── Resize active (vim hjkl, repeat enabled) ──────────────────────────
hl.bind(mod .. " + CTRL + L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- ─── Mouse drag move/resize ────────────────────────────────────────────
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ─── Workspaces (1-10) ─────────────────────────────────────────────────
for i = 1, 10 do
    local key = i % 10 -- 10 → 0
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move active window to relative workspace
hl.bind(mod .. " + CTRL + ALT + L", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mod .. " + CTRL + ALT + H", hl.dsp.window.move({ workspace = "r-1" }))

-- ─── Workspace navigation (scroll + previous) ──────────────────────────
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + period", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- ─── Scratchpad (special workspace) ────────────────────────────────────
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
hl.bind(mod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- ─── App switcher (alt-tab cycle) ──────────────────────────────────────
-- NOTE: original was `bindp` (press-only). Lua API has no documented equivalent;
-- using default bind. Adjust if you find the proper flag.
hl.bind("ALT + TAB", hl.dsp.exec_cmd("~/.config/hypr/scripts/cycle.sh next"))
hl.bind("ALT + grave", hl.dsp.exec_cmd("~/.config/hypr/scripts/cycle.sh prev"))

-- ─── Window groups (tabbed group) ──────────────────────────────────────
hl.bind(mod .. " + G", hl.dsp.group.toggle())
hl.bind("CTRL + comma", hl.dsp.group.prev())
hl.bind("CTRL + period", hl.dsp.group.next())
hl.bind(mod .. " + SHIFT + mouse_up", hl.dsp.group.prev())
hl.bind(mod .. " + SHIFT + mouse_down", hl.dsp.group.next())
hl.bind(mod .. " + ALT + L", hl.dsp.group.lock({ action = "toggle" }))
hl.bind(mod .. " + ALT + H", hl.dsp.window.move({ out_of_group = "l" }))
hl.bind(mod .. " + ALT + J", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mod .. " + ALT + K", hl.dsp.window.move({ into_group = "r" }))

-- ─── Move workspace between monitors ───────────────────────────────────
-- NOTE: original conf binds the same key twice (DP-3↔eDP-1 and DP-3↔eDP-2).
-- Keeping both — second registration likely overrides first.
hl.bind(mod .. " + ALT + Z", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-3", monitor2 = "eDP-1" }))
hl.bind(mod .. " + ALT + Z", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-3", monitor2 = "eDP-2" }))
hl.bind(mod .. " + ALT + SHIFT + Z", hl.dsp.workspace.move({ monitor = "DP-3" }))
hl.bind("ALT + CTRL + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("ALT + CTRL + L", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("ALT + CTRL + K", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("ALT + CTRL + J", hl.dsp.workspace.move({ monitor = "d" }))

-- ─── Android dev (scrcpy mirror) ───────────────────────────────────────
hl.bind(mod .. " + ALT + N", hl.dsp.exec_cmd("mirror"))

-- ─── Custom scripts ────────────────────────────────────────────────────
hl.bind(mod .. " + ALT + M", hl.dsp.exec_cmd("~/.config/waybar/scripts/asus_gpu_menu.sh")) -- ASUS GPU mode menu
hl.bind(mod .. " + ALT + V", hl.dsp.exec_cmd("~/.local/bin/netbird-gw toggle"))            -- toggle Netbird-gw
hl.bind(mod .. " + ALT + G", hl.dsp.exec_cmd("qs -c caelestia ipc call gameMode toggle"))  -- toggle caelestia game mode

-- ─── Keyboard backlight (laptop FN+F2/F3) ──────────────────────────────
-- No keybind needed — asusd handles Fn+F2/F3 in the EC and the keysym never
-- reaches Wayland. OSD notif fired by kb-bright-watcher (see autostart).

-- ─── Display backlight (laptop FN+F7/F8) ───────────────────────────────
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$HOME/.local/bin/brightness-adjust up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$HOME/.local/bin/brightness-adjust down"), { repeating = true })

-- ─── Hardware events (lid + monitor hotplug) ───────────────────────────
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
hl.bind("switch:on:DP-3", hl.dsp.exec_cmd([[hyprctl keyword monitor "eDP-1, disable"]]), { locked = true })
hl.bind(
    "switch:off:DP-3",
    hl.dsp.exec_cmd([[hyprctl keyword monitor "eDP-1, 2560x1600@120, 0x0, 1.25"]]),
    { locked = true }
)

-- ─── Screen capture ────────────────────────────────────────────────────
hl.bind("Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true })
hl.bind(mod .. " + P", hl.dsp.exec_cmd("caelestia screenshot --region"))
hl.bind(mod .. " + CTRL + P", hl.dsp.exec_cmd("hyprpicker -an"))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("caelestia screenshot"))

-- ─── Multimedia (FN+F1/F2/F3) ──────────────────────────────────────────
hl.bind("XF86Explorer", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86Mail", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86Search", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))

-- ─── ASUS M1/M2/M3 (volume up/down, mic mute) ──────────────────────────
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true }
)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Media play/pause/next/prev
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ─── ASUS hardware (M1-M4 / FN ROG keys) ───────────────────────────────
hl.bind("XF86Launch1", hl.dsp.exec_cmd("rog-control-center"))
hl.bind("XF86Launch2", hl.dsp.exec_cmd([[sh -c 'asusctl profile -n; notify-send -u low "ASUS profile changed"']]))
hl.bind(
    "XF86Launch3",
    hl.dsp.exec_cmd([[sh -c 'asusctl aura effect --next-mode; notify-send -u low "Rog Aura changed"']])
)
hl.bind("XF86Launch4", hl.dsp.exec_cmd([[sh -c 'asusctl profile -n; notify-send -u low "ASUS profile changed"']]))
