local dap_python = require('dap-python')
dap_python.setup("uv")
dap_python.test_runner = 'pytest'

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = vim.env.LLDB_EXEC_PATH,
    name = 'lldb'
}

dap.adapters.vcl = {
    name = 'falco',
    type = 'executable',
    command = 'falco',
    args = { 'dap' },
}

dap.configurations.vcl = {
    {
        type = 'vcl',
        request = 'launch',
        name = "Debug VCL by falco",
        mainVCL = "${file}",
        includePaths = { "${workspaceFolder}" },
    },
}

dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end,
    },
}

-- add `q` keymap to quit nvim-da-view filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "dap-view", "dap-view-term", "dap-repl" }, -- dap-repl is set by `nvim-dap`
    callback = function(args)
        vim.keymap.set("n", "q", "<C-w>q", { buffer = args.buf })
    end,
})
