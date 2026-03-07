require("config.lazy")
require("config.lsp")
require("config.treesitter")
require("config.dap")

vim.loader.enable()

require("nvim-dap-projects").search_project_config()

vim.g.tmux_navigator_no_mappings = 1

vim.g.trailing_whitespace_exclude_filetypes = {
    "alpha",
    "git",
    "gitcommit",
}
