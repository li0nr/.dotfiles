-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }
--
-- For example, changing the color scheme:
-- config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "GruvboxDarkHard"
-- config.colors = {
-- 	-- background = '#3b224c',
-- 	-- background = "#181616", -- vague.nvim bg
-- 	-- background = "#080808", -- almost black
-- 	background = "#0c0b0f", -- dark purple
-- 	-- background = "#020202", -- dark purple
-- 	-- background = "#17151c", -- brighter purple
-- 	-- background = "#16141a",
-- 	-- background = "#0e0e12", -- bright washed lavendar
-- 	-- background = 'rgba(59, 34, 76, 100%)',
-- 	cursor_border = "#bea3c7",
-- 	-- cursor_fg = "#281733",
-- 	cursor_bg = "#bea3c7",
-- 	-- selection_fg = '#281733',
-- }
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
-- config.color_scheme = 'Snazzy'

local font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", })
config.warn_about_missing_glyphs = false
config.font = font -- wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 11

config.enable_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 0.93


config.window_decorations = "INTEGRATED_BUTTONS" --TITLE " --|  RESIZE"

config.audible_bell = "Disabled"
config.keys = {

  { key = 'v',        mods = 'CTRL', action = wezterm.action { PasteFrom = 'Clipboard' } },
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  { key = "LeftArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
  -- Make Option-Right equivalent to Alt-f; forward-word
  { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
  -- wezterm supports the ctrl-a 
  { key = '0', mods = 'CTRL', action = wezterm.action { SendString = "\x05" } },

  -- launch another instance with ctrl+shift
  -- added some auto hot key mapping to launch with window+n
  { key="n", mods="CTRL|CMD", action=wezterm.action.SpawnWindow},

}
config.default_domain = 'WSL:Ubuntu'
-- and finally, return the configuration to wezterm
return config

