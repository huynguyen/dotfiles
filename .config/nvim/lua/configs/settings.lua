local opt = vim.opt

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
-- show absolute numbers in insert mode, relative in normal mode
vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]])

opt.showmatch = true        -- show matching brackets

opt.splitright = true       -- vsplit to right of current window
opt.splitbelow = true       -- hsplit to bottom of current window

opt.hidden = true           -- allow background buffers


vim.opt.errorbells = false
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

opt.scrolloff = 8           -- include 2 rows of context above/below current line
opt.sidescrolloff = 5       -- include 5 colums of context to the left/right of current column

opt.ignorecase = true       -- ignore case in searches...
opt.smartcase = true        -- ...unless we use mixed case

opt.joinspaces = false      -- join lines without two spaces


-- always show left gutter
vim.opt.signcolumn = "yes"

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
