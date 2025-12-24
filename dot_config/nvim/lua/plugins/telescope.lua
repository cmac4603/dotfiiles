return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "aaronhallaert/advanced-git-search.nvim",
        },
        opts = {
            defaults = {
                color_devicons = true,
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    height = 100,
                    width = 400,
                    preview_cutoff = 100,
                    prompt_position = "top",
                },
                prompt_prefix = " ",
                selection_caret = " ",
                file_ignore_patterns = { ".git/", "node_modules" },
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-u>"] = false,
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer +
                                require("telescope.actions").move_to_top,
                        }
                    }
                }
            },
            extensions = {
                advanced_git_search = { -- Browse command to open commits in browser. Default fugitive GBrowse.
                    browse_command = "GBrowse {commit_hash}",
                    diff_plugin = "fugitive",
                    show_builtin_git_pickers = false,
                    entry_default_author_or_date = "both", -- one of "author", "date" or "both"
                    keymaps = {
                        toggle_date_author = "<C-w>",
                        open_commit_in_browser = "<C-o>",
                        copy_commit_hash = "<C-y>",
                        show_entire_commit = "<C-e>",
                    },
                },
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
            },
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
        dependencies = {
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
    },
    {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
        end,
    },
    {
        "barrett-ruth/http-codes.nvim",
        config = true,
    },
    {
        "LinArcX/telescope-env.nvim",
        config = function()
            require("telescope").load_extension("env")
        end
    },
}
