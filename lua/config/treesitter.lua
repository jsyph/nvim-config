require("nvim-treesitter.configs").setup {
    ensure_installed = { "python", "cpp", "c", "lua", "vim", "json", "toml", "rust", "dart", "html", "css"},
    ignore_install = {},
    highlight = {
        enable = true,
    },
}
