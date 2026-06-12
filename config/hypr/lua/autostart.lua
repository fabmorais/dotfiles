-- autostart — sourced from hyprland.lua

hl.on("hyprland.start", function()
	-- kwallet unlock (pam_kwallet_init) is handled by XDG autostart — shared with KDE.
	hl.exec_cmd("caelestia shell -d") -- Caelestia shell
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

	-- Watch caelestia scheme changes → sync to all apps (alacritty, starship, ...)
	hl.exec_cmd("$HOME/.local/bin/caelestia-scheme-watcher")

	-- Fn+F2/F3 are swallowed by asusd at the EC, so a key bind never fires.
	-- Watch asusd's D-Bus PropertiesChanged signal instead and emit OSD notifs.
	hl.exec_cmd("$HOME/.local/bin/kb-bright-watcher")

	-- Clipboard watcher (cliphist)
	hl.exec_cmd("wl-paste --type text  --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
