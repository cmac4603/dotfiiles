-- requires `silicon` to be installed e.g. `brew install silicon`
return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("nvim-silicon").setup({
            -- for list of themes available use `silicon --list-themes`
            theme = "Dracula",
            -- for list of fonts installed use `fc-list`
            font = "JetBrainsMonoNLNerdFontMono-ExtraBold",
            no_window_controls = false,
            pad_horiz = 2,
            pad_vert = 2,
            output = function()
                local vpath = vim.fn.expand("~") .. "/Pictures/"
                local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
                local fname = vim.fn.fnamemodify(buf_name, ":t")
                return vpath .. fname .. "-" .. os.date("!%Y%m%d-%H%M%S") .. ".png"
            end,
        })
    end,
}
