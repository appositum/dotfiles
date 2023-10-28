-- ~/.local/share/nvim/lazy/lualine/lua/lualine/themes/catppuccin_mocha.lua
-- this file uses surface0 as bg, instead of surface1 like the default catppuccin lualine theme

local colors = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

return {
	normal = {
		a = { bg = colors.blue, fg = colors.mantle, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.blue },
		c = { bg = colors.mantle, fg = colors.text },
	},
	insert = {
		a = { bg = colors.green, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.green },
	},
	terminal = {
		a = { bg = colors.green, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.green },
	},
	command = {
		a = { bg = colors.peach, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.peach },
	},
	visual = {
		a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.mauve },
	},
	replace = {
		a = { bg = colors.red, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface0, fg = colors.red },
	},
	inactive = {
		a = { bg = colors.mantle, fg = colors.blue },
		b = { bg = colors.mantle, fg = colors.surface0, gui = "bold" },
		c = { bg = colors.mantle, fg = colors.overlay0 },
	}
}
