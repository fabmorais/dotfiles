-- Window rules — sourced from hyprland.lua

-- ─── Workspace pinning ─────────────────────────────────────────────────
hl.window_rule({
	match = { class = "^(steam.*)$" },
	workspace = "4",
})

-- ─── Opacity per app ───────────────────────────────────────────────────
-- Hyprland 0.55+: opacity is a string "active inactive [fullscreen]" (e.g. "0.9 0.7")
local function opacity_rule(class, active, inactive)
	hl.window_rule({
		match = { class = class },
		opacity = string.format("%.2f %.2f", active, inactive or active),
	})
end

opacity_rule("^(com.mitchellh.ghostty)$", 0.8)
opacity_rule("^(Alacritty)$", 0.8)
opacity_rule("^(brave-browser)$", 0.92)
opacity_rule("^(firefox)$", 0.92)
opacity_rule("^(FreeTube)$", 0.90)
opacity_rule("^(io.freetubeapp.FreeTube)$", 0.90)
opacity_rule("^(vesktop)$", 0.90)
opacity_rule("^(org.mozilla.Thunderbird)$", 0.90)
opacity_rule("^(Notesnook)$", 0.90)
opacity_rule("^(org.kde.dolphin)$", 0.80)
opacity_rule("^(opensnitch_ui)$", 0.80)
opacity_rule("^(com.nextcloud.desktopclient.nextcloud)$", 0.80)
opacity_rule("^(rog-control-center)$", 0.80)
opacity_rule("^(@filen/desktop)$", 0.80)
opacity_rule("^(wireguard-gui)$", 0.80)
opacity_rule("^(org.kde.kdeconnect.app)$", 0.80)
opacity_rule("^(timeshift-gtk)$", 0.80)
opacity_rule("^(1password)$", 0.80)
opacity_rule("^(proton.vpn.app.gtk)$", 0.80)
opacity_rule("^(solaar)$", 0.80)
opacity_rule("^(steam)$", 0.80)
opacity_rule("^(org.wireshark.Wireshark)$", 0.80)
opacity_rule("^(io.ente.auth)$", 0.70)
opacity_rule("^(calibre-gui)$", 0.80)
opacity_rule("^(org.gnome.seahorse.Application)$", 0.80)
opacity_rule("^(gimp)$", 0.90)
opacity_rule("^(LM-Studio)$", 0.80)
opacity_rule("^(localsend)$", 0.80)
opacity_rule("^(net.lutris.Lutris)$", 0.80)
opacity_rule("^(com.stremio.stremio)$", 0.80)
opacity_rule("^(Bitwarden)$", 0.80)
opacity_rule("^(piper)$", 0.80)
opacity_rule("^(virt-manager)$", 0.80)
opacity_rule("^(tutanota-desktop)$", 0.80)
opacity_rule("^(Tor Browser)$", 0.90)
opacity_rule("^(org.telegram.desktop)$", 0.80)
opacity_rule("^(Mullvad Browser)$", 0.90)
opacity_rule("^(com.moonlight_stream.Moonlight)$", 0.80)
opacity_rule("^(Element)$", 0.80)
opacity_rule("^(signal)$", 0.80)
opacity_rule("^(libreoffice-startcenter)$", 0.90)
opacity_rule("^(libreoffice-writer)$", 0.90)
opacity_rule("^(libreoffice-calc)$", 0.90)
opacity_rule("^(libreoffice-impress)$", 0.90)
opacity_rule("^(libreoffice-draw)$", 0.90)
opacity_rule("^(libreoffice-math)$", 0.90)
opacity_rule("^(libreoffice-base)$", 0.90)
opacity_rule("^(TuxGuitar)$", 0.80)
opacity_rule("^(obsidian)$", 0.80)
opacity_rule("^(ch.proton.bridge-gui)$", 0.90, 0.70)
opacity_rule("^(com.mastermindzh.tidal-hifi)$", 0.90, 0.70)
opacity_rule("^(feishin)$", 0.90, 0.70)
opacity_rule("^(codium)$", 0.80)
opacity_rule("^(codium-url-handler)$", 0.80)
opacity_rule("^(org.pulseaudio.pavucontrol)$", 0.80)
opacity_rule("^(com.saivert.pwvucontrol)$", 0.80)

-- initial_class / initial_title variants
hl.window_rule({
	match = { initial_class = "^(com.mastermindzh.tidal-hifi)$" },
	opacity = "0.70 0.70",
})
hl.window_rule({
	match = { initial_title = "^(Heroic Games Launcher)$" },
	opacity = "0.70 0.70",
})

-- ─── Alacritty: update-sys animation ───────────────────────────────────
hl.window_rule({
	name = "alacritty-update-sys-animation",
	match = { class = "^(Alacritty)$", title = "^(update-sys)$" },
	animation = "popin",
})

-- ─── scrcpy — Android phone mirror ─────────────────────────────────────
hl.window_rule({
	match = { class = "^(scrcpy)$" },
	float = true,
	size = "550 1223",
	move = "100%-570 76",
	pin = true,
})

-- ─── Float small utility windows ───────────────────────────────────────
hl.window_rule({
	name = "calculator-float",
	match = { initial_title = "^(Calculator)$" },
	float = true,
	size = "100 100",
	center = true,
})

hl.window_rule({
	name = "clocks-float",
	match = { initial_title = "^(Clocks)$" },
	float = true,
	size = "800 600",
	center = true,
})

hl.window_rule({
	name = "mousam-float",
	match = { class = "^(io.github.amit9838.mousam)$" },
	float = true,
	size = "1000 800",
	center = true,
})

hl.window_rule({
	name = "gnome-calendar-float",
	match = { class = "^(org.gnome.Calendar)$" },
	float = true,
	size = "1200 1000",
})

hl.window_rule({ match = { class = "^(io.elementary.calendar)$" }, float = true })
hl.window_rule({ match = { class = "^(timeshift-gtk)$" }, float = true })

hl.window_rule({
	name = "dolphin-float",
	match = { class = "^(org.kde.dolphin)$" },
	float = true,
	size = "1200 1000",
})

hl.window_rule({
	name = "pavucontrol-float",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
	size = "1200 1000",
})

hl.window_rule({
	name = "pwvucontrol-float",
	match = { class = "^(com.saivert.pwvucontrol)$" },
	float = true,
	size = "1200 1000",
})

hl.window_rule({ match = { initial_title = "^(Friends List)$" }, float = true })
hl.window_rule({ match = { title = "^(Friends List)$" }, float = true })

hl.window_rule({
	name = "ente-auth-float",
	match = { class = "^(io.ente.auth)$" },
	float = true,
	size = "800 600",
})

-- ─── Picture-in-Picture (FreeTube, Firefox, Brave, Chromium) ───────────
hl.window_rule({
	match = { title = "^(Picture in picture|Picture-in-Picture)$" },
	float = true,
	pin = true,
	size = "720 405",
	move = "100%-w-30 100%-h-50",
})

-- ─── Polkit auth prompts ───────────────────────────────────────────────
hl.window_rule({
	match = { class = "^(.*polkit.*authentication-agent.*|hyprpolkitagent)$" },
	float = true,
	pin = true,
})
hl.window_rule({
	match = { title = "^(Authentication Required)$" },
	float = true,
	pin = true,
})
