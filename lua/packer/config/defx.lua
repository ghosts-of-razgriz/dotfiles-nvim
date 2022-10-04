vim.call('defx#custom#option', '_', { columns = 'indent:icons:filename:indent:git' })

vim.call('defx#custom#column', 'git', 'indicators', {
        Modified = '',
        Staged = '',
        Untracked = '𥉉',
        Renamed = '',
        Unmerged = '',
        Ignored = '',
        Deleted = '',
        Unknown = 'ﬤ'
    })

vim.call('defx#custom#column', 'git', 'max_indicator_width', 2)
vim.call('defx#custom#column', 'git', 'column_length', 2)
vim.call('defx#custom#column', 'git', 'show_ignored', 1)

