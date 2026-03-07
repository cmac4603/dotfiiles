return {
    "utilyre/barbecue.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        exclude_filetypes = {
            "netrw",
            "toggleterm",
            "dap-view",
            "dap-view-term",
            "dap-view-help",
        },
    }
}
