return {
    "nvim-treesitter/nvim-treesitter",
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
            "vim",
            "vimdoc",
        })
    end,
}
