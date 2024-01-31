vim.opt.termguicolors = true
vim.opt.mousemoveevent = true

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		hover = {
			enabled = true,
			delay = 50,
			reveal = { "close" },
		},
		separator_style = "thick",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
