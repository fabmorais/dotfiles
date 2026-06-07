-- Animations — sourced from hyprland.lua
hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("ease", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "ease" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "ease" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "ease" })
