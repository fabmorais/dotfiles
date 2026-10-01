-- Monitor layout and workspace pinning — sourced from hyprland.lua

-- Layout is dynamic: Wine/Proton treats the output at 0x0 as the primary
-- monitor, so when the ultrawide (DP-3) is connected it owns the origin and
-- the laptop panel sits at negative X (physical layout unchanged: laptop
-- left, ultrawide right). Without DP-3 the laptop goes back to 0x0.
local LAPTOP_W = 2048 -- 2560 / 1.25 (logical width)

local function has_output(name, removed)
	local removed_name = type(removed) == "table" and removed.name or removed
	for _, m in ipairs(hl.get_monitors()) do
		if m.name == name and m.name ~= removed_name then
			return true
		end
	end
	return false
end

local function apply_layout(removed)
	local lx = has_output("DP-3", removed) and -LAPTOP_W or 0

	-- laptop panel on iGPU mode
	hl.monitor({
		output = "eDP-1",
		mode = "2560x1600@60",
		position = lx .. "x0",
		scale = "1.25",
	})

	-- laptop panel (the real active output, regardless of GPU mode)
	hl.monitor({
		output = "eDP-2",
		mode = "2560x1600@120",
		position = lx .. "x0",
		scale = "1.25",
	})

	-- external ultrawide (right)
	hl.monitor({
		output = "DP-3",
		mode = "3440x1440@165",
		position = "0x0",
		scale = "1",
	})

	-- projector above laptop
	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = (lx + 960) .. "x-1080",
		scale = "1",
	})
end

apply_layout()
hl.on("monitor.added", function()
	apply_layout()
end)
hl.on("monitor.removed", function(m)
	apply_layout(m)
end)

-- Workspace → monitor pinning
hl.workspace_rule({ workspace = "1", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3" })
hl.workspace_rule({ workspace = "3", monitor = "DP-3" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
-- ws 5 lives on the laptop panel. Single name-based rule: two rules broke
-- (the absent one wins -> fallback to DP-3) and `desc:` doesn't work in
-- workspace rules under the Lua parser. eDP-2 = dGPU (current/normal mode).
-- If you switch to iGPU mode (panel becomes eDP-1), change this to eDP-1.
hl.workspace_rule({ workspace = "5", monitor = "eDP-2", default = true })
