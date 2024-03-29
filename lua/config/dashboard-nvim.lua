local dashboard = require("dashboard")

local config = {}

config.header = {
	"                                 ",
	"                                 ",
	"           ▄ ▄                   ",
	"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
	"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
	"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
	"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
	"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
	"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
	"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
	"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
	"                                 ",
	"                                 ",
}

config.shortcut = {
	{
		icon = " ",
		desc = "Projects",
		key = "P",
		action = "Telescope projects",
	},
	{
		icon = " ",
		desc = "Config Directory",
		key = "C",
		action = function()
			vim.cmd("e " .. vim.fn.stdpath("config"))
		end,
	},
}

config.footer = {
	"                         ",
	"Made with love ❤️  by joe.",
	"       (っ◔◡◔)っ ❤       ",
}

config.packages = { enable = true }

config.mru = {
	limit = 9,
	icon = " ",
	label = "History",
	cwd_only = false,
}

dashboard.setup({
	theme = "hyper",
	shortcut_type = "number",
	config = config,
})
