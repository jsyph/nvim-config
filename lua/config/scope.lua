require("scope").setup {
    hooks = {
        pre_tab_close = function ()
            vim.cmd(":w")
        end
    }
}
