local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local module = {}

function module.apply_to_config(config)
	local keys = {
		-- Workspace switcher key bindings
		{
			key = "w",
			mods = "LEADER",
			action = workspace_switcher.switch_workspace(),
		},
		{
			key = "W",
			mods = "LEADER|SHIFT",
			action = workspace_switcher.switch_to_prev_workspace(),
		},
	}

	-- Merge the new keys into the existing config keys
	-- First check if config.keys exists, if not, initialize it
	if not config.keys then
		config.keys = {}
	end

	-- Then insert the new keys into the config.keys table
	for _, key in ipairs(keys) do
		table.insert(config.keys, key)
	end

	return config
end

return module
