call plug#begin()

" function library
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

" Looks
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mhinz/vim-startify'

Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

" debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jay-babu/mason-nvim-dap.nvim'

" mason shenanigans
Plug 'williamboman/mason.nvim'

" LSP cmnfig
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'mhartington/formatter.nvim'
Plug 'mfussenegger/nvim-lint'

" Comments
Plug 'numToStr/Comment.nvim'

" cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'FelipeLema/cmp-async-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'Saecki/crates.nvim'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'rcarriga/cmp-dap'

" Auto close tags
Plug 'windwp/nvim-autopairs'
" Secondary lsp
Plug 'dense-analysis/ale'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

colorscheme tokyonight-night

" allow mouse control
set mouse=a

let g:workspace_autocreate = 1

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Display numbers on left side
set number

" Toggle nvim-tree
autocmd VimEnter * NvimTreeToggle
" Move focus on opened file
autocmd VimEnter * wincmd p

let g:mkdp_auto_start = 1

let g:minimap_auto_start = 1
let g:minimap_width = 10

set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>
imap <C-BS> <C-W>


lua << EOF

require('mason').setup{}
require ('mason-nvim-dap').setup({
    ensure_installed = {'codelldb', 'debugpy'},
    handlers = {}, -- sets up dap in the predefined manner
})
require('formatter').setup{}
---------------------------------------------------- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
require("nvim-tree").setup{
view = {
	side = "right"	
}
}


---------------------------------------------------- autocomplete

local has_words_before = function()
unpack = unpack or table.unpack
local line, col = unpack(vim.api.nvim_win_get_cursor(0))
return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require('luasnip')

require("nvim-autopairs").setup {}
local cmp = require('cmp')

cmp.setup{
snippet = {
	expand = function(args)
	require('luasnip').lsp_expand(args.body)
	end,
	},
window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
	},
sources = cmp.config.sources{
{name = 'nvim_lsp'},
{ name = 'luasnip' },
{ name = 'async_path'},
{ name = 'emoji' },
 { name = 'nvim_lsp_signature_help' }
},

mapping = {
	['<C-Space>'] = cmp.mapping.confirm {
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
		},

	['<Tab>'] = function(fallback)
	if not cmp.select_next_item() then
		if vim.bo.buftype ~= 'prompt' and has_words_before() then
			cmp.complete()
		else
			fallback()
			end
			end
			end,

			['<S-Tab>'] = function(fallback)
			if not cmp.select_prev_item() then
				if vim.bo.buftype ~= 'prompt' and has_words_before() then
					cmp.complete()
				else
					fallback()
					end
					end
					end,
},
}
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
        { name = 'buffer' }
      }
    })

cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

require('crates').setup()

vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})

require("cmp").setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})
--------------------------------------------------- looks
require("indent_blankline").setup {
	show_current_context = true,
	show_current_context_start = true,
}
require('lualine').setup{}

--------------------------------------------------- lsp
local mason_lsp = require('mason-lspconfig')
mason_lsp.setup{
enusre_installed = {'rust_analyzer'},
automatic_installation = true,
}

mason_lsp.setup_handlers{
function (server_name)
	require('lspconfig')[server_name].setup {
		capabilities = require('cmp_nvim_lsp').default_capabilities(),
	}
	end,
}

--------------------------------------------------- linter
local lint = require('lint')

require('Comment').setup{
    toggler = {
        line = '<C-_>'
        }
    }


EOF
