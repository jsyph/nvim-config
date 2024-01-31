require("yanky").setup({
	ring = {
		storage = "shada",
		history_length = 50,
	},
	preserve_cursor_position = {
		enabled = false,
	},
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n" }, "<leader>p", function()
	require("telescope").extensions.yank_history.yank_history({})
end)
-- cycle through the yank history, only work after paste
vim.keymap.set("n", "[y", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "]y", "<Plug>(YankyCycleBackward)")
