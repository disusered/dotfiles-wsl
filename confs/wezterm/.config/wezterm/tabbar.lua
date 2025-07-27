local wezterm = require("wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local module = {}

function module.apply_to_config(config)
	-- Tab bar configuration
	bar.apply_to_config(config, {
		position = "bottom",
		padding = {
			left = 1,
			right = 2,
			tabs = {
				left = 1,
				right = 2,
			},
		},
		separator = {
			space = 1,
			left_icon = wezterm.nerdfonts.fa_long_arrow_right,
			right_icon = wezterm.nerdfonts.fa_long_arrow_left,
			field_icon = wezterm.nerdfonts.indent_line,
		},
		modules = {
			-- Color of the tabs
			tabs = {
				active_tab_fg = 4,
				inactive_tab_fg = 6,
				new_tab_fg = 2,
			},
			-- The current workspace name
			workspace = {
				enabled = true,
				icon = wezterm.nerdfonts.cod_window,
				color = 6,
			},
			-- Shows whether the leader key is active
			leader = {
				enabled = true,
				icon = wezterm.nerdfonts.cod_diff_modified,
				color = 1,
			},
			-- Shown when the pane is zoomed
			zoom = {
				enabled = true,
				icon = wezterm.nerdfonts.md_fullscreen,
				color = 3,
			},
			-- Not sure if this is needed
			pane = { enabled = false },
			-- I don't need to know the current user
			username = { enabled = false },
			-- I don't need to know the current hostname
			hostname = { enabled = false },
			-- We already have a clock in the prompt and neovim
			clock = { enabled = false },
			-- Show the full current working directory since we don't have it in the prompt or neovim
			cwd = {
				enabled = true,
				icon = wezterm.nerdfonts.oct_file_directory,
				color = 7,
			},
			-- No, just no
			spotify = { enabled = false },
		},
	})

	-- Use the default bg color for the tab bar
	config.colors = {
		tab_bar = {
			background = "transparent",
		},
	}
end

return module
