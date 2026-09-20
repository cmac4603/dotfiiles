return {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    -- move colorscheme activation if changing default options
    opts = {},
    config = function()
        vim.cmd("colorscheme teide")
    end,
}
