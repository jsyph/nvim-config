local keymap = vim.keymap

keymap.set({ "i" }, "<C-s>", "<C-o>:w<ENTER>")
keymap.set({ "n" }, "<C-s>", ":w<ENTER>")

keymap.set({ "n" }, "<Leader><Leader>", ":NvimTreeToggle<CR>")

keymap.set({ "n" }, "<Leader><Tab>", ":bnext<CR>")
keymap.set({ "n" }, "<Leader><S-Tab>", ":bprev<CR>")

keymap.set({ "v" }, "<A-Down>", ":m '>+1<CR>gv=gv")
keymap.set({ "v" }, "<A-Up>", ":m '<-2<CR>gv=gv")
