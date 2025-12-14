return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        },
        float = {
            -- Padding around the floating window
            padding = 10,
            -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            max_width = 0.5,
            max_height = 0.5,
            border = "rounded",
            preview_split = "auto",
        },
        lsp_file_methods = {
            -- Set to true to autosave buffers that are updated with LSP willRenameFiles
            -- Set to "unmodified" to only save unmodified buffers
            autosave_changes = true,
        },
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = false,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
