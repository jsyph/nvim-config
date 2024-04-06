local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
	---------------------------------------------------------------------------
	"nvim-lua/plenary.nvim",

	---------------------------------------------------------------------------
	-- autocomplete engine
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",

			"onsails/lspkind-nvim",
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},

	---------------------------------------------------------------------------
	-- mason
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	---------------------------------------------------------------------------
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("config.mason-lspconfig")
		end,
	},

	-- lsp config
	{
		"neovim/nvim-lspconfig",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("config.lsp")
		end,
	},
	---------------------------------------------------------------------------
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {},
	},
	-- Debuger
	{
		"mfussenegger/nvim-dap",
	},

	---------------------------------------------------------------------------
	-- Snippets engine
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("config.luasnip")
		end,
	},

	---------------------------------------------------------------------------
	-- linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("config.lint")
		end,
	},

	---------------------------------------------------------------------------
	-- hover preview window
	{
		dir = vim.fn.stdpath("config") .. "/custom_plugins/hover.nvim",
		config = function()
			require("config.hover")
		end,
	},
	---------------------------------------------------------------------------
	-- tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},

	---------------------------------------------------------------------------
	-- Auto brackets and pairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

	---------------------------------------------------------------------------
	-- Search and find
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-telescope/telescope-symbols.nvim" },
	},

	---------------------------------------------------------------------------
	-- Comment plugin
	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

	---------------------------------------------------------------------------
	-- nice file tree explorer thingy
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NVimTreeOpen" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.tree")
		end,
	},

	---------------------------------------------------------------------------
	-- notification plugin
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("config.nvim-notify")
		end,
	},

	---------------------------------------------------------------------------
	-- colorschemes
	{ "folke/tokyonight.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },

	---------------------------------------------------------------------------
	-- beter ui for some actions
	{ "stevearc/dressing.nvim", opts = {} },

	---------------------------------------------------------------------------
	-- awseome unix commands
	{ "tpope/vim-eunuch", cmd = { "Rename", "Delete", "SudoWrite", "SudoEdit" } },

	---------------------------------------------------------------------------
	-- Auto format tools
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = function()
			require("config.formatter")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	---------------------------------------------------------------------------

	-- sexy buffer bar
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.bufferline")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config.statusline")
		end,
	},

	{ "itchyny/vim-highlighturl", event = "VeryLazy" },

	{
		"nvimdev/dashboard-nvim",
		config = function()
			require("config.dashboard-nvim")
		end,
	},

	-- handsome scrollbar
	{ "dstein64/nvim-scrollview" },
	---------------------------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("config.indent-blankline")
		end,
	},

	---------------------------------------------------------------------------
	-- clipboard history and stuff
	{
		"gbprod/yanky.nvim",
		dependencies = { { "kkharji/sqlite.lua" } },
		config = function()
			require("config.yanky")
		end,
	},
	---------------------------------------------------------------------------
	{
		"jghauser/follow-md-links.nvim",
		ft = "markdown",
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"jubnzv/mdeval.nvim",
		ft = { "markdown" },
		config = function()
			require("config.mdeval")
		end,
	},
	{
		"AckslD/nvim-FeMaco.lua",
		config = function()
			require("config.femaco")
		end,
	},
	{
		"plasticboy/vim-markdown",
		dependencies = {
			{
				"godlygeek/tabular",
			},
		},
		config = function()
			require("config.vim-markdown")
		end,
		ft = { "markdown" },
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	---------------------------------------------------------------------------
	{ "cespare/vim-toml", ft = { "toml" }, branch = "main" }, -- showing keybindings

	---------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	---------------------------------------------------------------------------
	{
		"tiagovla/scope.nvim",
		config = function()
			require("config.scope")
		end,
	},

	---------------------------------------------------------------------------
	{
		dir = vim.fn.stdpath("config") .. "/custom_plugins/theme-changer",
		cmd = { "ChangeTheme", "CurrentTheme" },
		config = function()
			require("theme-changer").setup({
				default_theme = "tokyonight-night",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim", -- UI plugin
		},
	},
	---------------------------------------------------------------------------
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("config.project")
		end,
	},

	{
		"numToStr/FTerm.nvim",
		config = function()
			require("config.floating-term")
		end,
	},
}

-- configuration for lazy itself.
local lazy_opts = {
	ui = { border = "rounded", title = "Plugin Manager", title_pos = "center" },
}

require("lazy").setup(plugin_specs, lazy_opts)
