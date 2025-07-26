local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Set the color scheme
	config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

	-- Set the WSL domains
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
		},
	}
	config.default_domain = "WSL:Ubuntu"

	-- Tab bar
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false
end

return module
