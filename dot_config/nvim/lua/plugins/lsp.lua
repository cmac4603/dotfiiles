return {

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "b0o/schemastore.nvim",

    -- maybe add one day
    -- {
    --     "nvimdev/lspsaga.nvim",
    --     config = function()
    --         require('lspsaga').setup({
    --             lightbulb = { ignore = { ft = { 'http' } } }
    --         })
    --     end,
    --     ft = {
    --         "docker",
    --         "helm",
    --         "html",
    --         "http",
    --         "lua",
    --         "python",
    --         "rust",
    --         "toml",
    --     },
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    -- },

    -- golang
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        build = function()
            -- will update plugin's deps on every update
            vim.cmd.GoInstallDeps()
        end,
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
        lazy = false,   -- This plugin is already lazy
    },

    {
        "saecki/crates.nvim",
        tag = "stable",
        config = function()
            require("crates").setup({})
        end,
    },

    -- typescript
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
        },
        ft = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
        },
        opts = {},
    },

    -- jinja2
    { "HiPhish/jinja.vim", },

    -- vcl syntax highlighting support
    { "fgsch/vim-varnish", },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {},
    },

}
