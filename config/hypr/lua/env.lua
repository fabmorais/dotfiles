-- Environment variables — sourced from hyprland.lua
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("ZDOTDIR", os.getenv("HOME"))

-- Toolkit backends (Wayland-first, X11 fallback)
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland,x11,windows")
hl.env("CLUTTER_BACKEND", "wayland")

-- Qt behavior
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qtengine") -- Qt apps follow caelestia scheme via qtengine

-- Firefox Wayland
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Java apps fix (IntelliJ, etc.)
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
