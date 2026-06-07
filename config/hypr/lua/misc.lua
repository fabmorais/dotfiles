-- Misc behaviors + XWayland — sourced from hyprland.lua
hl.config({
	misc = {
		allow_session_lock_restore = true,
		focus_on_activate = false,
	},

	xwayland = {
		force_zero_scaling = true, -- X11 apps render sharp (native res) instead of blurry-scaled
	},
})
