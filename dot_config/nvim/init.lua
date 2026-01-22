require("config.lazy")
require("config.lsp")

vim.loader.enable()

require("nvim-dap-projects").search_project_config()

vim.g.trailing_whitespace_exclude_filetypes = {
    "alpha",
    "git",
    "gitcommit",
}
