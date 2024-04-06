require("femaco").setup({
	float_opts = function(code_block)
		return {
			relative = "cursor",
			width = clip_val(5, 120, vim.api.nvim_win_get_width(0) - 10), -- TODO how to offset sign column etc?
			height = clip_val(5, #code_block.lines, vim.api.nvim_win_get_height(0) - 6),
			anchor = "NW",
			row = 0,
			col = 0,
			border = "rounded",
			zindex = 1,
		}
	end,
})
