return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.install({
            "haskell",
            "racket",
            "lua",
            "python",
            "javascript",
            "typescript",
            "elixir",
            "heex",
            "eex",
            "vim",
            "vimdoc",
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { "elixir", "heex", "eex", "haskell", "racket", "typescript", "javascript" },
            callback = function() vim.treesitter.start() end
        })
    end,
}
