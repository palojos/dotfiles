return {
    "jpalardy/vim-slime",
    init = function()
        vim.g.slime_target = "tmux"
        vim.g.slime_dont_ask_default = 0
        vim.g.slime_bracketed_paste = 1

        vim.g.slime_default_config = {
            socket_name = "default",
            target_pane = ":.#{==:#{pane_title},repl}",
        }
    end,
    keys = {
        -- Normal mode: sends line / motion
        { "<leader>r", "<cmd>SlimeSend<cr>", mode = "n", desc = "Send line to REPL" },
        -- Visual mode: sends selection
        { "<leader>r", ":SlimeSend<cr>",     mode = "v", desc = "Send selection to REPL" },
    },
}
