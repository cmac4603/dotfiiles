return {

    {
        "olimorris/codecompanion.nvim",
        version = "v17.33.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "franco-ruggeri/codecompanion-spinner.nvim",
                opts = {},
            },
        },
        opts = {
            adapters = {
                http = {
                    vertex = function()
                        return require("codecompanion.adapters").extend("vertex", {
                            env = {
                                project_id = "hdm-ai-dev",
                                api_key = "cmd: gcloud auth application-default print-access-token",
                            },
                            schema = {
                                model = {
                                    default = "google/gemini-2.5-pro"
                                }
                            }
                        })
                    end,
                }
            },
            strategies = {
                chat = {
                    name = "copilot",
                    model = "claude-sonnet-4",
                    tools = {
                        ["mcp"] = {
                            -- Prevent mcphub from loading before needed
                            callback = function()
                                return require("mcphub.extensions.codecompanion")
                            end,
                            description = "Call tools and resources from the MCP Servers"
                        }
                    }
                },
                inline = {
                    adapter = "copilot",
                    model = "claude-sonnet-4",
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
        }
    },

    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_enabled = 0
        end,
    },

    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        cmd = "MCPHub",              -- lazy load by default
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
                    }
                }
            })
        end,
    },

    {
        "ThePrimeagen/99",
        config = function()
            local _99 = require("99")

            _99.setup({
                md_files = {
                    "AGENT.md",
                },
            })

            vim.keymap.set("n", "<leader>af", function()
                _99.fill_in_function()
            end)

            vim.keymap.set("v", "<leader>av", function()
                _99.visual()
            end)

            vim.keymap.set("v", "<leader>a9s", function()
                _99.stop_all_requests()
            end)
        end,
    },
}
