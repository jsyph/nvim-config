local term = require("FTerm")

term.setup({
	border = "rounded",
})

vim.keymap.set("n", "<Leader><Enter>", function()
	term.toggle()
end)

-- Btop
local btop = term:new({
	ft = "fterm_btop",
	cmd = "btop",
})

vim.api.nvim_create_user_command("Btop", function()
	btop:toggle()
end, { bang = true })

