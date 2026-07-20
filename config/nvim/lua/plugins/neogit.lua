return {
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim"
        },
        cmd = "Neogit",
        config = function()
            require("neogit").setup({
                graph_style = "kitty",
                kind = "split",
                signs = {
                    -- { CLOSED, OPENED }
                    section = { "", "" },
                    item = { "", "" },
                    hunk = { "", "" },
                },
            })
        end,
        keys = {
            { "<leader>g", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    }
}
