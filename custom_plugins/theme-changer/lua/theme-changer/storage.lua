M = {}

local Path = require("plenary.path")
local storage_path = Path:new(vim.fn.stdpath("cache") .. "/theme-changer/storage.txt")

function M.init(default_theme)
	assert(default_theme, "Need default theme")
	if not storage_path:exists() then
		if vim.g.theme_changer_verbose then
			vim.notify("Storage Path does not exist", vim.log.levels.verbose)
		end

		if storage_path:touch({ parents = true }) == nil then
			vim.notify("Unable to create theme storage file\n" .. storage_path, "error")
			return
		end

		if vim.g.theme_changer_verbose then
			vim.notify("Created storage file and parent directories", vim.log.verbose)
		end

		storage_path:write(default_theme, "w")

		if vim.g.theme_changer_verbose then
			vim.notify("Wrote [" .. default_theme .. "] to storage file", vim.log.verbose)
		end
	end
end

function M.store_theme(theme)
	storage_path:write(theme, "w")
end

function M.retrieve_theme()
	if not storage_path:exists() then
		return
	end

	local stored = storage_path:read()
	if stored == nil then
		vim.notify("Unable to read theme storage file.\n" .. storage_path, "error")
		return
	end

	return stored
end

return M
