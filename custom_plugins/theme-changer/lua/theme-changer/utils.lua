local M = {}

function M.get_themes()
	return vim.fn.getcompletion("", "color")
end

function M.set_colorscheme(colorsheme)
	vim.cmd("colorscheme " .. colorsheme)
end

function M.notify_error(text)
	vim.notify(text, "error")
end

function M.notify_verbose(text)
	if not vim.g.theme_changer_verbose then
		return
	end
	vim.notify(text, vim.log.levels.verbose)
end

function M.notify_success(text)
	vim.notify(text)
end

return M
