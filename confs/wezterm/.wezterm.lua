local wezterm = require("wezterm")

-- My configs
local init = require("init")
local fonts = require("fonts")
local tabbar = require("tabbar")
local tmux = require("tmux")
local keys = require("keys")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply configs
init.apply_to_config(config)
tmux.apply_to_config(config)
fonts.apply_to_config(config)
tabbar.apply_to_config(config)
keys.apply_to_config(config)

-- Finally, return the configuration to wezterm:
return config
