-- Monitor layout and workspace pinning — sourced from hyprland.lua

-- laptop (left) iGPU
hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@60",
    position = "0x0",
    scale = "1.25",
})

-- laptop (left) dGPU
hl.monitor({
    output = "eDP-2",
    mode = "2560x1600@120",
    position = "0x0",
    scale = "1.25",
})

-- external ultrawide (right)
hl.monitor({
    output = "DP-3",
    mode = "3440x1440@165",
    position = "2048x0",
    scale = "1",
})

-- projector above laptop
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "960x-1080",
    scale = "1",
})

-- Workspace → monitor pinning
hl.workspace_rule({ workspace = "1", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3" })
hl.workspace_rule({ workspace = "3", monitor = "DP-3" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1", default = true })
