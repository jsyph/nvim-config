local mason_lsp = require("mason-lspconfig")
mason_lsp.setup {
    automatic_installation = true,
}

mason_lsp.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end
}
