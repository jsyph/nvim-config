local Menu = require("nui.menu")
local event = require("nui.utils.autocmd")

local window_options = {
	position = "50%",
	size = "25%",
	border = {
		style = "rounded",
		text = { top = " Select A Theme ", top_align = "center" },
	},
	win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
}

local window_content = {
	max_width = 30,
	keymap = {
		focus_next = { "j", "<Down>", "<Tab>" },
		focus_prev = { "k", "<Up>", "<S-Tab>" },
		close = { "<Esc>", "<C-c>" },
		submit = { "<CR>" },
	},
	lines = {},
}

M = {}

function M.choose_menu(themes, on_submit, custom_map, on_custom_map)
	for i = 0, #themes do
		window_content.lines[i] = Menu.item(themes[i])
	end

	window_content.on_submit = on_submit

	local menu = Menu(window_options, window_content)

	menu:map("n", custom_map, on_custom_map, { noremap = true })

	menu:mount()
end

return M
