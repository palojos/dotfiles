return {
    dir = "~/Repos/nvim-ollama/",
    lazy = false,
    config = function()
        local ollama = require "nvim-ollama"
        ollama.setup({})

        vim.keymap.set({ 'n', 'v' }, '<leader>af', ollama.fix)
    end
}
