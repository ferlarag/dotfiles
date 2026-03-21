-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

-- This is where you actually apply your config choices
config.color_scheme = "Poimandres"
config.default_cursor_style = "BlinkingBlock"
config.color_scheme = "Poimandres"

-- font
-- config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 18 -- 18 default
config.line_height = 1.9 -- 1.9 default
-- config.window_background_opacity = 1
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 999999
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = {
	brightness = 0.7,
}
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
