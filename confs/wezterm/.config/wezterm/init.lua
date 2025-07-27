local module = {}

function module.apply_to_config(config)
	-- Set the color scheme
	config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

	-- Disable window decorations i.e. the title bar and borders
	config.window_decorations = "RESIZE"

	-- No padding around the window
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}

	-- Set the WSL domains
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
		},
	}

	-- Default WSL domain is Ubuntu
	config.default_domain = "WSL:Ubuntu"
end

return module
