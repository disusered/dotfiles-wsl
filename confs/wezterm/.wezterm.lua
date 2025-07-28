local wezterm = require("wezterm")

-- My configs
local init = require("init")
local fonts = require("fonts")
local tabbar = require("tabbar")
local tmux = require("tmux")
local keys = require("keys")
local sessions = require("sessions")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply configs
init.apply_to_config(config)
tmux.apply_to_config(config)
fonts.apply_to_config(config)
tabbar.apply_to_config(config, {
	modules = {
		-- Change the leader icon
		leader = { icon = wezterm.nerdfonts.cod_diff_modified },
		-- Shown when the pane is zoomed
		zoom = { enabled = true },
		-- Disable pane information
		pane = { enabled = false },
		-- I don't need to know the current user
		username = { enabled = false },
		-- I don't need to know the current hostname
		hostname = { enabled = false },
		-- We already have a clock in the prompt and neovim
		clock = { enabled = false },
	},
})
keys.apply_to_config(config)
sessions.apply_to_config(config)

-- Finally, return the configuration to wezterm:
return config
