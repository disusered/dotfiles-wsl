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
end

return module
