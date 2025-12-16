return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        opts = {},
    },
    {
        "rhysd/git-messenger.vim",
        config = function()
            vim.g.git_messenger_always_into_popup = true
            vim.g.git_messenger_floating_win_opts = { border = 'single' }
        end,
    },
    {
        'topaxi/pipeline.nvim',
        build = 'make',
        ---@type pipeline.Config
        opts = {
            split = {
                relative = 'editor',
                position = 'right',
                size = 120,
                win_options = {
                    wrap = true,
                    number = false,
                    foldlevel = nil,
                    foldcolumn = '0',
                    cursorcolumn = false,
                    signcolumn = 'no',
                },
            },
        },
    },
    {
        "esmuellert/vscode-diff.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        cmd = "CodeDiff",
    },
}
