-- --- 1. THE INTERFACE & WINDOW BEHAVIORS --------------------------------
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Use hybrid relative numbering for fast jumping
vim.opt.mouse = "a"            -- Allow mouse control (clicking, dragging, tabs)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard directly for yanking/pasting
vim.opt.termguicolors = true   -- Enable true color engine (required for Catppuccin)
vim.opt.showmode = false       -- Hide the default -- INSERT -- text (keeps it clean)

-- --- 2. TABS & INDENTATION ----------------------------------------------
vim.opt.tabstop = 4            -- Render tabs as 4 spaces
vim.opt.softtabstop = 4        -- Editing tabs match 4 spaces
vim.opt.shiftwidth = 4         -- Auto-indents use 4 spaces
vim.opt.expandtab = true       -- Convert physical tabs into spaces
vim.opt.smartindent = true     -- Enable context-aware coding indentation

-- --- 3. SEARCH MECHANICS ------------------------------------------------
vim.opt.ignorecase = true      -- Case-insensitive searching
vim.opt.smartcase = true       -- ...unless an uppercase character is typed
vim.opt.hlsearch = false       -- Clear highlighting after search matches are found

-- --- 4. BACKUP & ARCHITECTURE SECURITY ----------------------------------
vim.opt.swapfile = false       -- Disable annoying .swp files
vim.opt.backup = false         -- Prevent duplicate backup files
vim.opt.undofile = true        -- Maintain permanent undo history across file closes

-- --- 5. NATIVE CATPPUCCIN MOCHA COLORSCHEME FALLBACK ---------------------
-- Set a premium dark palette matching Mocha's terminal specifications
vim.cmd([[
  highlight Normal guibg=#1e1e2e guifg=#cdd6f4
  highlight LineNr guifg=#585b70
  highlight CursorLineNr guifg=#cba6f7 gui=bold
  highlight Visual guibg=#313244
  highlight Search guibg=#f38ba8 guifg=#11111b
  highlight StatusLine guibg=#181825 guifg=#cdd6f4
  highlight VertSplit guifg=#313244 guibg=NONE
]])

