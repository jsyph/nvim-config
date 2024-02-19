require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		python = { "black" },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	formatters = {
		rustfmt = {
			command = "cargo fmt",
		},
	},
})
