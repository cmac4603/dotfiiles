return {

    { "tpope/vim-fugitive" },

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
            vim.g.git_messenger_floating_win_opts = { border = "single" }
        end,
    },

    {
        "topaxi/pipeline.nvim",
        build = "make",
        ---@type pipeline.Config
        opts = {
            split = {
                relative = "editor",
                position = "right",
                size = 120,
                win_options = {
                    wrap = true,
                    number = false,
                    foldlevel = nil,
                    foldcolumn = "0",
                    cursorcolumn = false,
                    signcolumn = "no",
                },
            },
        },
    },

    {
        "sindrets/diffview.nvim",
    },

    {
        "emrearmagan/atlas.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "sindrets/diffview.nvim",
        },
        -- See Configuration below
        ---@type AtlasConfig
        opts = {
            providers = {
                ---@type AtlasGitHubConfig
                github = {
                    cache_ttl = 120,
                },
            },
            pulls = {
                ---@type AtlasGitHubPullsConfig
                github = {
                    ---@type AtlasGitHubViewConfig[]
                    views = {
                        {
                            name = "My PRs",
                            key = "1",
                            layout = "plain",
                            current_repo = true, -- Limit this view to the local repository.
                            search = "author:@me sort:updated-desc",
                        },
                        {
                            name = "Team",
                            key = "2",
                            layout = "compact",
                            search = "org:Media-Platforms sort:updated-desc",
                        },
                    },

                    bookmarks = {
                        key = "S", -- default
                        label = "Search", -- default
                        items = {
                            ["Drafts"] = "is:pr is:draft author:@me",
                            ["Recently merged"] = "is:pr is:merged author:@me sort:updated-desc",
                            ["Review requested"] = "is:pr is:open review-requested:@me",
                        },
                    },
                },
            },
        },
    },

    {
        "ldelossa/gh.nvim", -- pr-reviews
        dependencies = {
            {
                "ldelossa/litee.nvim",
                config = function()
                    require("litee.lib").setup()
                end,
            },
        },
        config = function()
            require("litee.gh").setup()
        end,
    },
}
