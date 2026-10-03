-- autostart — sourced from hyprland.lua

hl.on("hyprland.start", function()
    -- kwallet unlock (pam_kwallet_init) is handled by XDG autostart — shared with KDE.
    -- Noctalia shell — start first so it claims the tray watcher before tray apps register.
    -- Its storage key must live in the PAM-unlocked "login" keyring (set as default), or
    -- the clipboard history comes up empty after every boot.
    hl.exec_cmd("noctalia -d")
    hl.exec_cmd("sway-audio-idle-inhibit")
    -- hypridle managed by systemd unit (enabled, starts on graphical-session.target)
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent") -- polkit GUI prompts (timeshift, etc.)

    -- Pinned apps per workspace (silent = don't steal focus on launch).
    -- Uses the dispatcher form because hl.exec_cmd() takes no rules table;
    -- hl.dsp.exec_cmd does, and hl.dispatch() invokes it imperatively.
    hl.dispatch(hl.dsp.exec_cmd("firefox", { workspace = "1 silent" }))
    hl.dispatch(hl.dsp.exec_cmd("alacritty", { workspace = "2 silent" }))
    hl.dispatch(hl.dsp.exec_cmd("brave", { workspace = "3 silent" }))
    hl.dispatch(hl.dsp.exec_cmd("/usr/bin/obsidian", { workspace = "special:scratchpad silent" }))

    -- Filen sync client (tray). Delayed so the keyring is unlocked first: started
    -- before it, the app comes up unauthenticated and wipes its sync state.
    -- Moved here from ~/.config/autostart/filen-desktop.desktop (Hidden=true there
    -- now) — two autostarts means two instances, and the second one is a broken
    -- window with no sync in it.
    hl.exec_cmd("sleep 5 && filen-desktop")

    -- OpenSnitch firewall prompts/tray (daemon is the opensnitchd system service).
    -- Delayed so Noctalia already owns the tray watcher; the XDG autostart entry in
    -- ~/.config/autostart stays Hidden=true to avoid a second instance.
    hl.exec_cmd("sleep 3 && opensnitch-ui")

    -- Fn+F2/F3 are swallowed by asusd at the EC, so a key bind never fires.
    -- Watch asusd's D-Bus PropertiesChanged signal instead and emit OSD notifs.
    hl.exec_cmd("$HOME/.local/bin/kb-bright-watcher")

    -- Clipboard watcher (cliphist)
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- hyprpm reload
    hl.exec_cmd("sleep 1 && hyprpm reload")
end)
