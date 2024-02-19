local utils = require("theme-changer.utils")
local storage = require("theme-changer.storage")
local ui = require("theme-changer.ui")

local M = {}

function M.setup(config)
	if config.verbose then
		vim.g.theme_changer_verbose = config.verbose
	end

	if not config.default_theme then
		config.default_theme = "default"
	end

	utils.notify_verbose("Default theme is [" .. config.default_theme .. "]")

	storage.init(config.default_theme)
end

function M.current_theme()
	utils.notify_success(storage.retrieve_theme())
end

function M.change_theme()
	ui.choose_menu(
		utils.get_themes(),
		function(item)
			utils.set_colorscheme(item.text)
			storage.store_theme(item.text)
		end,
		"<space>",
		function(bufnr)
			utils.set_colorscheme(bufnr)
		end
	)
end

return M
