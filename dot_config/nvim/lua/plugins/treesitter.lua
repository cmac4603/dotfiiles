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
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                branch = "main",
            },
        },
        opts = {
            highlight = true,
            ignore = {
                "blink-cmp-documentation",
                "blink-cmp-menu",
                "checkhealth",
                "codecompanion",
                "lazy",
                "lazy_backdrop",
                "mason",
                "mason_backdrop",
                "oil",
                "qf",
                "snacks_dashboard",
                "snacks_notif",
                "TelescopePrompt",
                "TelescopeResults",
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
