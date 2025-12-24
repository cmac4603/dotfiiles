return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = "all",        -- one of "all" or a list of languages
            ignore_install = { "ipkg" },     -- List of parsers to ignore installing
            sync_install = false,            -- install languages synchronously (only applied to `ensure_installed`)
            highlight = {
                enable = true,               -- false will disable the whole extension
                disable = { "css", "rust" }, -- list of language that will be disabled
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { "css" } },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        },
        init = function()
            require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
                local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
                local filename = vim.fn.fnamemodify(filepath, ":t")
                return string.match(filename, ".*mise.*%.toml$") ~= nil
            end, { force = true, all = false })
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
}
