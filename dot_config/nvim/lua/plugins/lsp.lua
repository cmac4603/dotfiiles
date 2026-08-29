return {

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "b0o/schemastore.nvim",

    -- golang
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        build = function()
            -- will update plugin's deps on every update
            vim.cmd.GoInstallDeps()
        end,
        ---@module "gopher"
        ---@type gopher.Config
        opts = {},
    },

    -- rust
    -- With lazy.nvim
    {
        "alexpasmantier/krust.nvim",
        ft = "rust",
        opts = {
            keymap = "<leader>k",
            float_win = {
                border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
                auto_focus = false,
            },
        },
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^6", -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    {
        "saecki/crates.nvim",
        tag = "stable",
        config = function()
            require("crates").setup({})
        end,
    },

    -- java
    -- {
    --     "nvim-java/nvim-java",
    --     config = function()
    --         require("java").setup()
    --         vim.lsp.enable("jdtls")
    --     end,
    -- },

    -- jinja2
    { "HiPhish/jinja.vim" },

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },

    -- vcl syntax highlighting support
    { "fgsch/vim-varnish" },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {},
    },

    {
        "jim-at-jibba/micropython.nvim",
        dependencies = { "folke/snacks.nvim" },
    },
}
