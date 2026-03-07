return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "ldelossa/nvim-dap-projects",
            "ravsii/nvim-dap-envfile",
        },
        config = function()
            local dap_python = require('dap-python')
            dap_python.setup("uv")
            dap_python.test_runner = 'pytest'

            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = vim.env.LLDB_EXEC_PATH,
                name = 'lldb'
            }

            dap.adapters.vcl = {
                name = 'falco',
                type = 'executable',
                command = 'falco',
                args = { 'dap' },
            }

            dap.configurations.vcl = {
                {
                    type = 'vcl',
                    request = 'launch',
                    name = "Debug VCL by falco",
                    mainVCL = "${file}",
                    includePaths = { "${workspaceFolder}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    env = function()
                        local variables = {}
                        for k, v in pairs(vim.fn.environ()) do
                            table.insert(variables, string.format("%s=%s", k, v))
                        end
                        return variables
                    end,
                },
            }
        end
    },

    {
        "igorlfs/nvim-dap-view",
        -- let the plugin lazy load itself
        lazy = false,
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {},
    },

    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "go",
        opts = {},
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        ---@type MasonNvimDapSettings
        opts = {
            -- This line is essential to making automatic installation work
            -- :exploding-brain
            handlers = {},
            automatic_installation = {
                -- These will be configured by separate plugins.
                exclude = {
                    "delve",
                    "python",
                },
            },
            -- DAP servers: Mason will be invoked to install these if necessary.
            ensure_installed = {
                "bash",
                "codelldb",
                "php",
                "python",
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

}
