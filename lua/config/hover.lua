require("hover").setup({
	init = function()
		-- Require providers
		require("hover.providers.lsp")
	end,
	preview_opts = {
		border = "rounded",
	},
	mouse_providers = {
		"LSP",
	},
	mouse_delay = 500,
    stylize_markdown = true,
})

-- Setup keymaps
vim.keymap.set("n", "<Leader><Space>", require("hover").hover, { desc = "hover.nvim" })

-- https://old.reddit.com/r/neovim/comments/180fmw5/add_this_to_make_nvmcmp_docs_look_way_better_in/ka8of5r/
-- Render docs as sexy markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "hover",
	callback = function()
		vim.treesitter.start(0, "markdown")
	end,
})
