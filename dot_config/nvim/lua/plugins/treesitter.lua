return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        opts = {
            ensure_installed = "all",        -- one of "all" or a list of languages
            ignore_install = { "ipkg" },     -- List of parsers to ignore installing
            sync_install = false,            -- install languages synchronously (only applied to `ensure_installed`)
            autopairs = {
                enable = true,
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
