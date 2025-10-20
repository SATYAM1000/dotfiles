-- File explorer appearance
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line Numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Shows absolute line number on cursor line (when relative number is on)

-- Tabs & Indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one
opt.smartindent = true -- Make indenting smarter

-- Line Wrapping
opt.wrap = false -- Disable line wrapping
opt.linebreak = true -- Companion to wrap, don't split words

-- Search Settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- Highlight all search results
opt.incsearch = true -- Show search results as you type

-- Cursor Line
opt.cursorline = true -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.background = "dark" -- Colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift
opt.pumheight = 10 -- Pop up menu height
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Allows neovim to access the system clipboard

-- Split Windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Word Navigation
opt.iskeyword:append("-") -- Consider string-string as whole word

-- Performance
opt.updatetime = 250 -- Faster completion (default is 4000ms)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.lazyredraw = false -- Don't redraw while executing macros (good performance config)
opt.redrawtime = 1500 -- Time in milliseconds for redrawing

-- Undo & Backup
opt.swapfile = false -- Don't use swapfile
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't backup file before overwriting
opt.undofile = true -- Enable persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Set undo directory

-- Scrolling
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor

-- Completion
opt.completeopt = "menuone,noselect" -- Better completion experience
opt.shortmess:append("c") -- Don't show redundant messages from ins-completion-menu

-- Folding
opt.foldmethod = "expr" -- Use treesitter for folding
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- Disable folding at startup
opt.foldlevel = 99 -- Open all folds by default
