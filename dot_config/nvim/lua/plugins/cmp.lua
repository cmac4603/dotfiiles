return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-tree/nvim-web-devicons",
        "onsails/lspkind.nvim",
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'enter' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    padding = { 0, 1 }, -- padding only on right side
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    components = {
                        kind_icon = {
                            text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
                        }
                    }
                }
            },
        },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            per_filetype = {
                sql = { 'snippets', 'dadbod', 'buffer' },
            },
            -- add vim-dadbod-completion to your completion providers
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
}
