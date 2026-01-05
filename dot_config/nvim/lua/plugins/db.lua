return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.dbs = {
            { name = 'rover-db-kubefeature-readonly', url = 'postgres://postgres@localhost:10185/mediaos' },
            { name = 'bam-db-sharedapps-readonly',    url = 'postgres://postgres@localhost:10253/bam' },
            { name = 'bam-db-sharedapps',             url = 'postgres://postgres@localhost:15444/bam' },
        }
    end,
}
