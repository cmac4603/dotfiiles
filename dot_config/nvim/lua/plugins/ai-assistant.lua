return {

    {
        "olimorris/codecompanion.nvim",
        version = "v17.33.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-treesitter/nvim-treesitter",
                branch = "main",
            },
            {
                "franco-ruggeri/codecompanion-spinner.nvim",
                opts = {},
            },
        },
        opts = {
            interactions = {
                chat = {
                    adapter = "opencode",
                },
            },
            memory = {
                opts = {
                    chat = {
                        enabled = true,
                    },
                },
                claude = {
                    description = "Memory files for Claude Code users",
                    parser = "claude",
                    files = {
                        "AGENT.md",
                        "memory-bank/",
                    },
                },
            },
        },
    },

    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        cmd = "MCPHub", -- lazy load by default
        build = "bundled_build.lua", -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
        config = function()
            require("mcphub").setup({
                use_bundled_binary = true,
                extensions = {
                    codecompanion = {
                        -- Show the mcp tool result in the chat buffer
                        show_result_in_chat = true,
                        -- Make chat #variables from MCP server resources
                        make_vars = true,
                        -- Create slash commands for prompts
                        make_slash_commands = true,
                    },
                },
            })
        end,
    },
}
