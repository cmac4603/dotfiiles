return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter").install_default_parsers()
        end
    },

    {
        -- simple Neovim plugin that provides automatic installation
        -- for the new rewrite of nvim-treesitter
        "mks-h/treesitter-autoinstall.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            highlight = true,
            ignore = {
                "blink-cmp-documentation",
                "blink-cmp-menu",
                "codecompanion",
                "checkhealth",
                "oil",
                "snacks_dashboard",
                "snacks_notif",
                "TelescopeResults",
                "TelescopePrompt",
                "toggleterm",
            },
        },
    },

    "nvim-treesitter/nvim-treesitter-context",

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
    },

    "JoosepAlviste/nvim-ts-context-commentstring",

}
