local opt = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed
opt.clipboard = 'unnamedplus'   -- use system clipboard 
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.confirm = true              -- confirm to save changes before exiting modified buffer
opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
opt.scrolloff = 10              -- lines of context
opt.swapfile = false            -- no .swp file

-- Indentation
opt.tabstop = 4 -- the number of visual spaces per TAB
opt.softtabstop = 4 -- number of spaces in tab when editing
opt.shiftwidth = 4 -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of Python
opt.smartindent = true -- insert indents automatically

-- UI config
opt.number = true               -- show absolute number
opt.relativenumber = true       -- show relative line number
opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
opt.showmode = false            -- don't show mode since we have a statusline
opt.wrap = false                -- text wrapping
opt.showmatch = true            -- show the matching brackets, curly braces or parentheses
opt.smoothscroll = true

-- Searching
opt.incsearch = true            -- search as characters are entered
opt.hlsearch = false            -- do not highlight matches
opt.ignorecase = true           -- ignore case in searches by default
opt.smartcase = true            -- but make it case sensitive if an uppercase is entered
