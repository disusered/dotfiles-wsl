local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Tab bar configuration
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = true
end

return module
