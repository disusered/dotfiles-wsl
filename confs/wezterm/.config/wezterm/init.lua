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

	-- Spawn a fish shell in login mode
	config.default_prog = { "/usr/bin/zsh" }

	-- Set the WSL domains
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
			default_cwd = "/home/carlos",
		},
	}

	config.ssh_domains = {
		{
			name = "SSH:Ubuntu",
			remote_address = "127.0.0.1",
			username = "carlos",
			connect_automatically = true,
			multiplexing = "None",
			assume_shell = "Posix",
		},
	}

	-- Default domain is WSL Ubuntu
	config.default_domain = "WSL:Ubuntu"

	config.launch_menu = {
		{
			label = "CRI SSH (Staging)",
			args = { "ssh", "ser_stage" },
		},
	}
end

return module
