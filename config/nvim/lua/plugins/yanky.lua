return {
    "gbprod/yanky.nvim",
    opts = {
        ring = { history_length = 100 },
    },
    keys = {
        { "p",     "<Plug>(YankyPutAfter)",      mode = { "n", "x" },            desc = "Put after" },
        { "P",     "<Plug>(YankyPutBefore)",     mode = { "n", "x" },            desc = "Put before" },
        { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to previous yank" },
        { "<c-n>", "<Plug>(YankyNextEntry)",     desc = "Cycle to next yank" },
    },
}
