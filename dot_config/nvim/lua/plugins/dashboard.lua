---@module 'snacks'
return {
    "folke/snacks.nvim",
    ---@module 'snacks'
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua require'config.telescope'.project_files()" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "t", desc = "Find Text", action = ":Telescope live_grep" },
                    { icon = " ", key = "g", desc = "Search Git", action = ":AdvancedGitSearch" },
                    {
                        icon = " ",
                        key = "h",
                        desc = "Harpoon",
                        action = function()
                            local harpoon = require("harpoon")
                            require('config.telescope').toggle_telescope(harpoon:list())
                        end
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "d", desc = "Open DBUI", action = ":DBUI" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys",  gap = 1, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    desc = "Browse Repo",
                    padding = 1,
                    key = "b",
                    action = function()
                        Snacks.gitbrowse()
                    end,
                },
                function()
                    local in_git = Snacks.git.get_root() ~= nil
                    local cmds = {
                        {
                            title = "Git Graph",
                            icon = " ",
                            cmd = "git log --oneline --decorate --graph --all -n 10",
                            height = 12,
                        },
                        {
                            title = "Current PR Status",
                            icon = " ",
                            cmd = "gh pr status",
                            key = "p",
                            action = function()
                                vim.fn.jobstart("gh pr view --web", { detach = true })
                            end,
                            height = 10,
                        },
                        {
                            title = "Current PR Checks",
                            icon = " ",
                            cmd = "gh pr checks || echo \"\"",
                            key = "c",
                            action = function()
                                vim.fn.jobstart("gh pr checks --web", { detach = true })
                            end,
                            height = 10,
                        },
                        {
                            title = "Git Diff Status",
                            icon = " ",
                            cmd = "git --no-pager diff --stat -B -M -C",
                            height = 10,
                        },
                    }
                    return vim.tbl_map(function(cmd)
                        return vim.tbl_extend("force", {
                            pane = 2,
                            section = "terminal",
                            enabled = in_git,
                            padding = 1,
                            ttl = 2 * 60,
                            indent = 3,
                        }, cmd)
                    end, cmds)
                end,
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        gitbrowse = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 5000,
        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        picker = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true } -- Wrap notifications
            }
        },
        zen = { enabled = true },
    },
}
