return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function()
        local wk = require("which-key")
        local harpoon = require("harpoon")

        wk.add({
            { "<leader>a",  group = "AI" },
            { "<leader>aa", "<CMD>CodeCompanionActions<CR>",     desc = "Actions",             mode = { "n", "v" } },
            { "<leader>ae", "<CMD>CodeCompanion /explain<CR>",   desc = "Explain Code",        mode = { "n", "v" } },
            { "<leader>ac", "<CMD>CodeCompanionChat<CR>",        desc = "Open Chat" },
            { "<leader>ag", "<CMD>CodeCompanion /commit<CR>",    desc = "Commit Message" },
            { "<leader>am", "<CMD>MCPHub<CR>",                   desc = "Open MCPHub",         mode = { "n" } },
            { "<leader>at", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
            { "<leader>au", "<CMD>CodeCompanion /unittests<CR>", desc = "Generate Unit Tests", mode = { "n", "v" } },
        })

        wk.add({
            { "<leader>d",  group = "Debugger" },
            { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",        desc = "Toggle Breakpoint" },
            { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",                 desc = "Continue" },
            { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",                desc = "Step Into" },
            { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",                desc = "Step Over" },
            { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>",                 desc = "Step Out" },
            { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",              desc = "Toggle REPL" },
            { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>",                 desc = "Run Last" },
            { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>",                 desc = "Toggle UI" },
            { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>",                desc = "Terminate" },
            { "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>",     desc = "Python Test Method" },
            { "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>",      desc = "Python Test Class" },
            { "<leader>ds", "<cmd>lua require('dap-python').debug_selection()<cr>", desc = "Python Debug Selection", mode = "v" },
        })

        wk.add({
            { "<leader>D",  group = "DB" },
            { "<leader>Da", "<CMD>DBUIAddConnection<CR>", desc = "DBUI Add Connection" },
            { "<leader>Db", "<CMD>DBUI<CR>",              desc = "DBUI" },
            { "<leader>Df", "<CMD>DBUIFindBufffer<CR>",   desc = "DBUI Find Buffer" },
            { "<leader>Dt", "<CMD>DBUIToggle<CR>",        desc = "DBUI Toggle" },
        })

        wk.add({
            { "<leader>f",  group = "Find" },
            { "<leader>fb", "<CMD>Telescope buffers<CR>",                                                       desc = "Find buffers" },
            { "<leader>fe", "<CMD>Telescope env<CR>",                                                           desc = "Find environment variables" },
            { "<leader>fg", "<CMD>AdvancedGitSearch diff_commit_file<CR>",                                      desc = "Git diff commit file search" },
            { "<leader>fG", "<CMD>AdvancedGitSearch search_log_content<CR>",                                    desc = "Search in repo log content" },
            { "<leader>fh", function() require('config.telescope-config').toggle_telescope(harpoon:list()) end, desc = "Find harpoons" },
            { "<leader>fH", "<cmd>HTTPCodes<cr>",                                                               desc = "Find HTTP codes" },
            { "<leader>ff", "<CMD>lua require'config.telescope-config'.project_files()<CR>",                    desc = "Find files (default git_files, fallback find_files)" },
            { "<leader>fk", "<CMD>Telescope keymaps<CR>",                                                       desc = "Find keymaps" },
            { "<leader>fn", "<CMD>ObsidianDailies<CR>",                                                         desc = "Find obsidian dailies" },
            { "<leader>fs", "<CMD>ScratchList<CR>",                                                             desc = "Find scratch" },
            { "<leader>ft", "<CMD>Telescope live_grep<CR>",                                                     desc = "Find text" },
            { "<leader>fT", "<CMD>Telescope toggleterm<CR>",                                                    desc = "Find terminals" },
            { "<leader>fw", "<CMD>Telescope grep_string<CR>",                                                   desc = "Find word under cursor" },
            { "<leader>fy", "<CMD>Telescope neoclip<CR>",                                                       desc = "Find yanks" },
        })

        wk.add({
            { "<leader>g",   group = "Git" },
            { '<leader>ga',  '<cmd>Pipeline<cr>',                                                   desc = 'Open GitHub Actions Pipelines' },
            { "<leader>gb",  "<CMD>BlameToggle window<CR>",                                         desc = "Git Blame Window" },
            { "<leader>gc",  "<CMD>GhPrComments<CR>",                                               desc = "Open GitHub PR Comments" },
            { "<leader>gC",  "<CMD>GhPrCommentsClear<CR>",                                          desc = "Clear GitHub PR Comments" },
            { "<leader>gdh", ":CodeDiff HEAD~",                                                     desc = "Open CodeDiff incl. last x commits" },
            { "<leader>gd1", "<CMD>CodeDiff HEAD~1<CR>",                                            desc = "Open CodeDiff incl. last 1 commits" },
            { "<leader>gd2", "<CMD>CodeDiff HEAD~2<CR>",                                            desc = "Open CodeDiff incl. last 2 commits" },
            { "<leader>gd3", "<CMD>CodeDiff HEAD~3<CR>",                                            desc = "Open CodeDiff incl. last 3 commits" },
            { "<leader>gd4", "<CMD>CodeDiff HEAD~4<CR>",                                            desc = "Open CodeDiff incl. last 4 commits" },
            { "<leader>gd5", "<CMD>CodeDiff HEAD~5<CR>",                                            desc = "Open CodeDiff incl. last 5 commits" },
            { "<leader>gdo", "<CMD>CodeDiff<CR>",                                                   desc = "Open CodeDiff" },
            { "<leader>gdr", ":CodeDiff ",                                                          desc = "Open CodeDiff by range/sha/two revisions" },
            { "<leader>gf",  "<CMD>AdvancedGitSearch<CR>",                                          desc = "Find Git Commits That Changed The Current File" },
            { "<leader>go",  function() Snacks.gitbrowse() end,                                     desc = "Open Remote Git URL" },
            { "<leader>gp",  function() vim.fn.jobstart("gh pr view --web", { detach = true }) end, desc = "Open Github PR" },
        })

        wk.add({
            { "<leader>h",  group = "Harpoon" },
            { "<leader>hh", function() harpoon:list():add() end,                         desc = "Harpoon it!" },
            { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
        })

        wk.add({
            { "<leader>m",  group = "Markdown" },
            { "<leader>mt", "<CMD>RenderMarkdown toggle<CR>", desc = "Split Toggle" },
        })

        wk.add({
            { "<leader>.", "<CMD>Scratch<CR>", desc = "Open Daily Scratch" },
        })

        wk.add({
            { "<leader>u",  group = "UndoTree" },
            { "<leader>ut", "<CMD>UndotreeToggle<CR>", desc = "Toggle" },
        })

        -- random assortment
        wk.add({
            { "<leader>yp",  "<CMD>CopyRelPath<CR>",                            desc = "Copy the relative filepath to system clipboard" },
            { "<leader>oo",  "<CMD>silent !tmux-sessionizer -s 0 --vsplit<CR>", desc = "Open Opencode In New Tmux Pane" },
            { "<leader>csv", "<CMD>CsvViewToggle<CR>",                          desc = "Toggle CSV View" },
            { "<leader>ht",  ":Hardtime toggle<CR>",                            desc = "Hardtime Toggle" },
            { "<leader>l",   function() Snacks.notifier.show_history() end,     desc = "Show notification history (logs)" },
            { "<leader>z",   "<CMD>ZenMode<CR>",                                desc = "Zen Toggle" },
        })
    end
}
