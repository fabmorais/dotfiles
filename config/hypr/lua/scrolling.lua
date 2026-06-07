-- Scrolling layout — sourced from hyprland.lua (NOT loaded by default; opt-in)
hl.config({
    scrolling = {
        column_width = 0.5,
        fullscreen_on_one_column = true,
        follow_focus = true,
        direction = "right",
    },
})

hl.workspace_rule({ workspace = "3", layout = "scrolling" })
