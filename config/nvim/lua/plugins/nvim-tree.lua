return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Adds full-color file logos next to names
  },
  config = function()
    -- 1. Disable legacy netrw completely at initialization
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 2. Boot up Nvim-Tree with modern tiling optimizations
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30, -- Left sidebar thickness column width
        side = "left",
      },
      actions = {
          open_file = {
              quit_on_open = true,
          },
      },
      renderer = {
        group_empty = true, -- condenses empty folder paths elegantly
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false, -- FALSE ensures your hidden .config directories stay visible!
      },
    })

    -- 3. Map a clean hotkey to slide the sidebar open and shut
    -- Press Space + e (or Ctrl + n) to toggle the display
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
  end,
}
