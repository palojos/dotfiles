-- --- 1. THE INTERFACE & WINDOW BEHAVIORS --------------------------------
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Use hybrid relative numbering for fast jumping
vim.opt.mouse = "a"               -- Allow mouse control (clicking, dragging, tabs)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard directly for yanking/pasting
vim.opt.termguicolors = true      -- Enable true color engine (required for Catppuccin)
vim.opt.showmode = false          -- Hide the default -- INSERT -- text (keeps it clean)

-- --- 2. TABS & INDENTATION ----------------------------------------------
vim.opt.tabstop = 4        -- Render tabs as 4 spaces
vim.opt.softtabstop = 4    -- Editing tabs match 4 spaces
vim.opt.shiftwidth = 4     -- Auto-indents use 4 spaces
vim.opt.expandtab = true   -- Convert physical tabs into spaces
vim.opt.smartindent = true -- Enable context-aware coding indentation

-- --- 3. SEARCH MECHANICS ------------------------------------------------
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true  -- ...unless an uppercase character is typed
vim.opt.hlsearch = false  -- Clear highlighting after search matches are found

-- --- 4. BACKUP & ARCHITECTURE SECURITY ----------------------------------
vim.opt.swapfile = false -- Disable annoying .swp files
vim.opt.backup = false   -- Prevent duplicate backup files
vim.opt.undofile = true  -- Maintain permanent undo history across file closes

-- Lazy.nvim setup
-- 1. Map your leader key to Space (crucial to do BEFORE loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 2. Automatically download lazy.nvim from GitHub if it's missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }):wait()
    if out.code ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out.stderr,                     "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- 3. Execute lazy.nvim and tell it to load everything inside lua/plugins/
require("lazy").setup({
    spec = {
        { import = "plugins" }, -- This automatically scans the lua/plugins folder!
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = false }, -- Prevents random background update notifications
})

-- 4. Custom keymaps

vim.keymap.set("n", "<leader>p", require("telescope.builtin").find_files, { desc = "Fuzzy Find Files" })
vim.keymap.set("v", "<", "<gv", { desc = "Shift indent left and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift indent right and keep selection" })

vim.keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Start of Line (First non-blanck)" })
vim.keymap.set({ "n", "v", "o" }, "L", "$", { desc = "End of Line" })

vim.keymap.set({ "n", "v" }, "<leader>H", "gg", { desc = "End of Line" })
vim.keymap.set({ "n", "v" }, "<leader>L", "G", { desc = "End of Line" })
