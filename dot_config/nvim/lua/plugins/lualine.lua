return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            section_separators = { "", "" },
            component_separators = { "", "" },
            theme = "auto",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename", "location" },
            lualine_x = { "rest" },
            lualine_y = { "encoding", "fileformat", "filetype" },
            lualine_z = { "progress" },
        },
    },
}
