" General tab settings
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

" Display line number
set number

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" Use mouse to select and resize windows, etc.
set mouse=a  " Enable mouse in several mode
set mousemodel=popup

" PopUp menu settings
aunmenu PopUp.-1-
aunmenu PopUp.How-to\ disable\ mouse 

nnoremenu PopUp.Neoformat :Neoformat<CR>
inoremenu PopUp.Select\ All <C-Home><C-O>VG

" Disable showing current mode on command line since statusline plugins can show it.
set noshowmode

" Ask for confirmation when handling unsaved or read-only files
set confirm

set history=500  " The number of command and search history to keep

" Persistent undo even after you close a file and re-open it
set undofile

set pumheight=10  " Maximum number of items to show in popup menu
set pumblend=10  " pseudo transparency for completion menu

set winblend=0  " pseudo transparency for floating window

" Correctly break multi-byte characters such as CJK,
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

set signcolumn=yes:1

set clipboard+=unnamedplus

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Insert mode key word completion setting
set complete+=kspell complete-=w complete-=b complete-=u complete-=t

set spelllang=en  " Spell languages
set spellsuggest+=9  " show 9 spell suggestions at most

set synmaxcol=250  " Text after this column number is not highlighted
set nostartofline

