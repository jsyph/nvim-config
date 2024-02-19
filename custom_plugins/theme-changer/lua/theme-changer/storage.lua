M = {}

local Path = require("plenary.path")
local utils = require("theme-changer.utils")
local storage_path = Path:new(vim.fn.stdpath("config") .. "/lua/colorschemes.lua")

function M.init(default_theme)
    assert(default_theme, "Need default theme")
    if not storage_path:exists() then
        utils.notify_verbose("Storage Path does not exist")

        if storage_path:touch({ parents = true }) == nil then
            utils.notify_error("Unable to create theme storage file\n" .. storage_path)
            return
        end

        utils.notify_verbose("Created storage file and parent directories")

        M.store_theme(default_theme)

        utils.notify_verbose("Wrote [" .. default_theme .. "] to storage file")
    end
end

function M.store_theme(theme)
    storage_path:write("vim.cmd[[colorscheme " .. theme .. "]]", "w")

end

function M.retrieve_theme()
    if not storage_path:exists() then
        return
    end

    local stored = storage_path:read()
    if stored == nil then
        utils.notify_error("Unable to read theme storage file.\n" .. storage_path)
        return
    end

    return stored
end

return M
