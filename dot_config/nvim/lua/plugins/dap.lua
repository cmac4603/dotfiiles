return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "ldelossa/nvim-dap-projects",
            {
                "ravsii/nvim-dap-envfile",
                opts = {},
            },
        },
        config = function()
            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51a1a" })
            vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e51a1a" })
            vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#e51a1a" })
            vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#e51a1a" })
            vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })

            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition",
                { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected",
                { text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
            vim.fn.sign_define("DapLogPoint", { text = "◈", texthl = "DapLogPoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
        end,
    },

    {
        "igorlfs/nvim-dap-view",
        -- let the plugin lazy load itself
        lazy = false,
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {
            follow_tab = true,
            windows = {
                position = "right",
                size = 0.45,
            },
        },
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
