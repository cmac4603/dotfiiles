require("config.lazy")

TOGGLE_TELESCOPE = function(harpoon_files)
    -- telescope function for harpoon
    local conf = require("telescope.config").values

    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

require("nvim-dap-projects").search_project_config()

-- NOTE: add when this is released in newer nvim
-- vim.lsp.on_type_formatting.enable()

vim.g.trailing_whitespace_exclude_filetypes = {
    "alpha",
    "git",
    "gitcommit",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        -- "bacon",
        "bacon_ls",
        "basedpyright",
        -- "cpptools",  -- wrong names?
        -- "codelldb",  -- wrong names?
        "codespell",
        "cssls",
        "dockerls",
        "gopls",
        "helm_ls",
        "html",
        -- "htmx",  -- borked right now on macos
        "jinja_lsp",
        "jsonls",
        "lua_ls",
        "marksman",
        "ruff",
        "tailwindcss",
        "terraformls",
        "taplo",
        "ts_ls",
        -- "ty",
        "yamlls",
    },
})

vim.lsp.enable({
    "bacon_ls",
    "basedpyright",
    "cpptools",
    "codelldb",
    "codespell",
    "cssls",
    "djlint",
    "dockerls",
    "gopls",
    "helm_ls",
    "html",
    -- "htmx",
    "jinja_lsp",
    "lua_ls",
    "ruff",
    -- NOTE: allow rustaceanvim to setup
    -- "rust_analyzer",
    "taplo", -- toml
    -- TODO: reenable when ty gets better
    -- "ty",
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gh",
            "<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
            opts
        )
        vim.keymap.set("n", "gi",
            "<CMD>lua require('tiny-inline-diagnostic').toggle()<CR>",
            opts
        )
        -- waiting for https://github.com/neovim/neovim/pull/23871
        -- vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end,
        --     { noremap = true, silent = true })
        vim.keymap.set("n", "gF", "<CMD>lua vim.lsp.buf.format()<CR>", opts)
        vim.keymap.set("n", "gR", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
    end,
})

-- GO
vim.lsp.config("gopls", {
    settings = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
            unusedParams = true,
        },
    },
})

-- HELM
vim.lsp.config("helm_ls", {
    settings = {
        ['helm-ls'] = {
            yamlls = {
                path = "yaml-language-server",
            }
        }
    }
})

-- HTML
vim.lsp.config("html", {
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
})

-- JINJA
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

-- JSON
vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas {
                select = {
                    '.eslintrc',
                    'package.json',
                },
            },
            validate = { enable = true },
        },
    },
})

-- LUA
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require',
                    'Snacks'
                },
            },
            workspace = {
                checkThirdParty = false,
                -- Make the server aware of Neovim runtime files
                library = {
                    vim.env.VIMRUNTIME,
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- PYTHON
vim.lsp.config("basedpyright", {
    -- NOTE: may not be needed when this feature is released (up top)
    -- capabilities = {
    --     textDocument = {
    --         onTypeFormatting = {
    --             dynamicRegistration = true,
    --         },
    --     },
    -- },
    settings = {
        basedpyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
            -- investigate slowdown
            reportImportCycles = false,
            typeCheckingMode = "recommended",
        },
        python = {
            analysis = {
                ignore = { "*" },
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = "LSP: Disable hover capability from Ruff",
})

-- RUST
vim.lsp.config("bacon_ls", {
    init_options = {
        updateOnSave = true,
        runBaconInBackground = true,
    }
})

-- NOTE: using rustaceanvim instead
-- vim.lsp.config("rust_analyzer", {
--     settings = {
--         ['rust-analyzer'] = {
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--                 features = "all",
--             },
--             checkOnSave = {
--                 enable = false,
--             },
--             diagnostics = {
--                 enable = false,
--             },
--             procMacro = {
--                 enabled = true,
--             },
--         },
--     }
-- })

vim.g.rustaceanvim = function()
    local cfg = require('rustaceanvim.config')
    return {
        dap = {},
        -- LSP configuration
        server = {
            default_settings = {
                -- rust-analyzer language server configuration
                ['rust-analyzer'] = {
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                        features = "all",
                    },
                    checkOnSave = {
                        enable = true,
                    },
                    diagnostics = {
                        enable = true,
                    },
                    procMacro = {
                        enabled = true,
                    },
                },
            },
        },
        -- Plugin configuration
        tools = {},
    }
end

-- YAML
vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = require('schemastore').yaml.schemas()
        },
    },
})

vim.filetype.add({
    extension = {
        ['http'] = 'http',
    },
})
