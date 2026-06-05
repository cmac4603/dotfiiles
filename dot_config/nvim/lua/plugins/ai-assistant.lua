return {

    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "franco-ruggeri/codecompanion-spinner.nvim",
                opts = {},
            },
            "viespejo/cc-adapter-vertex-ai.nvim",
        },
        opts = {
            adapters = {
                http = {
                    vertex_anthropic = function()
                        return require("codecompanion.adapters").extend("vertex-anthropic", {
                            env = {
                                project_id = "hdm-ai-dev",
                                region = "global",
                            },
                        })
                    end,
                    vertex_gemini = function()
                        return require("codecompanion.adapters").extend("vertex-gemini", {
                            env = {
                                project_id = "hdm-ai-dev",
                                region = "global",
                                model = "gemini-3.1-flash-lite-preview",
                            },
                        })
                    end,
                    ["llama.cpp"] = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                url = "http://127.0.0.1:8080", -- replace with your llama.cpp instance
                                api_key = "TERM",
                                chat_url = "/v1/chat/completions",
                            },
                        })
                    end,
                },
            },
            interactions = {
                background = {
                    adapter = "vertex_gemini",
                },
                chat = {
                    adapter = "vertex_gemini",
                },
                cmd = {
                    adapter = "vertex_gemini",
                },
                inline = {
                    adapter = "vertex_gemini",
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
