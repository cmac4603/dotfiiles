return {

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            },
            float = {
                -- Padding around the floating window
                padding = 10,
                -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                max_width = 0.5,
                max_height = 0.5,
                border = "rounded",
                preview_split = "auto",
            },
            lsp_file_methods = {
                -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                -- Set to "unmodified" to only save unmodified buffers
                autosave_changes = true,
            },
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = true,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            prompt_save_on_select_new_entry = false,
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },

    {
        'johnpmitsch/vai.nvim',
        config = function()
            require('vai').setup()
        end,
    },

    {
        "chentoast/marks.nvim",
        opts = {
            builtin_marks = { ".", "<", ">", "^" },
            refresh_interval = 250,
            sign_priority = { lower = 1, upper = 15, builtin = 8, bookmark = 20 },
        }
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false,
        opts = {
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                container = {
                    enable_character_fade = true
                },
                name = {
                    trailing_slash = true,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖", -- this can only be used in the git_status source
                        renamed   = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
                -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
                file_size = {
                    enabled = true,
                    required_width = 64, -- min width of window required to show this column
                },
                type = {
                    enabled = true,
                    required_width = 122, -- min width of window required to show this column
                },
                last_modified = {
                    enabled = true,
                    required_width = 88, -- min width of window required to show this column
                },
                created = {
                    enabled = true,
                    required_width = 110, -- min width of window required to show this column
                },
                symlink_target = {
                    enabled = false,
                },
            },
            window = {
                position = "left",
                width = 40,
            },
            filesystem = {
                window = {
                    mappings = {
                        ["L"] = "open_nofocus"
                    },
                },
                commands = {
                    open_nofocus = function(state)
                        require("neo-tree.sources.filesystem.commands").open(state)
                        vim.schedule(function()
                            vim.cmd([[Neotree close]])
                        end)
                    end,
                },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        ".DS_Store",
                        "thumbs.db"
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        ".null-ls_*",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true,         -- This will find and focus the file in the active buffer every time
                    leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                group_empty_dirs = true,    -- when true, empty folders will be grouped together
                show_unloaded = true,
            }
        }
    },

    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    },

}
