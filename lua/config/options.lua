local opt = vim.opt
local o = vim.o
local wo = vim.wo

-- Line numbers
wo.number = true -- Make line numbers default (default: false)
o.relativenumber = true -- Set relative numbered lines (default: false)

-- Clipboard
o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neo (default: '')

-- Line break
o.wrap = false -- Display lines as one long line (default: true)
o.linebreak = true -- Companion to wrap, don't split words (default: false)

-- Mouse access
o.mouse = 'a' -- Enable mouse mode (default: '')

-- Cursor
o.cursorline = false -- Highlight the current line (default: false)

-- Indentation
o.autoindent = true -- Copy indent from current line when starting new one (default: true)
o.smartindent = true -- Make indenting smarter again (default: false)
o.breakindent = true -- Enable break indent (default: false)

-- Search settings
o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
o.smartcase = true -- Smart case (default: false)

-- Tabs
o.shiftwidth = 2 -- The number of spaces inserted for each indentation (default: 8)
o.tabstop = 2 -- Insert n spaces for a tab (default: 8)
o.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
o.expandtab = true -- Convert tabs to spaces (default: false)
o.showtabline = 2 -- Always show tabs (default: 1)

-- Scrolling
o.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

-- Splitting
o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)

-- Highlighting
o.hlsearch = false -- Set highlight on search (default: true)

o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)

-- Terminal colours
opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)

-- Horizontal movement
o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')

-- Column
o.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')

-- Swap file & backup
o.swapfile = true -- Creates a swapfile (default: true)
o.backup = false -- Creates a backup file (default: false)
o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
o.undofile = true -- Save undo history (default: false)

-- Backspace
o.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')

-- Pop up & messages
o.pumheight = 10 -- Pop up menu height (default: 0)
o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)

-- Markdown
o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)

-- File encoding
o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')

-- Timing
o.updatetime = 250 -- Decrease update time (default: 4000)
o.timeoutlen = 1000 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)

-- Completion
o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')

opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
