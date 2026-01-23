vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

local M = {}

M.install_default_parsers = function()
    require "nvim-treesitter".install {
        "bash",
        "comment",
        "csv",
        "dockerfile",
        "editorconfig",
        "elixir",
        "erlang",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "helm",
        "html",
        "http",
        "javascript",
        "json",
        "json5",
        "lua",
        "luadoc",
        "make",
        "markdown_inline",
        "markdown",
        "mermaid",
        "nginx",
        "pem",
        "proto",
        "python",
        "regex",
        "requirements",
        "robots_txt",
        "rust",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "tsv",
        "typescript",
        "vimdoc",
    }
end

return M
