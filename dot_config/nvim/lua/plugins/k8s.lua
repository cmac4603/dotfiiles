return {
    {
        "ramilito/kubectl.nvim",
        version = "2.*",
        dependencies = "saghen/blink.download",
        config = function()
            require("kubectl").setup({
                headers = {
                    enabled = false,
                },
            })
        end,
        keys = {
            { "<leader>k", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open kubectl.nvim" },
            { "<C-h>",     "<Plug>(kubectl.toggle_headers)",           ft = "k8s_*" },
            { "<C-k>",     "<Plug>(kubectl.kill)",                     ft = "k8s_*" },
        },
    },
}
