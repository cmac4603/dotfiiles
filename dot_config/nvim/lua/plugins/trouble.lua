return {
    "folke/trouble.nvim",
    opts = {
        auto_open = false,
        auto_close = true,
        auto_preview = true,
        use_diagnostic_signs = true,
        modes = {
            diagnostics = {
                win = {
                    size = 0.3,
                },
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
            lsp = {
                win = { position = "right" },
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>tp",
            "<cmd>Trouble preview_float toggle<cr>",
            desc = "Diagnostics Preview (Trouble)",
        },
    },
}
