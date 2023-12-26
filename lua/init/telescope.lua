local leader = '<leader>'
local localleader = '<localleader>'
local nore = { noremap = true }

vim.keymap.set('n', leader .. 'u<space>', ':Telescope ', nore) -- Telescope <prompt>
vim.keymap.set('n', leader .. 'uu', '<cmd>Telescope find_files<cr>', nore) -- find files
vim.keymap.set('n', leader .. 'ut', '<cmd>Telescope<cr>', nore) -- Telescope commands
vim.keymap.set('n', leader .. 'ub', '<cmd>Telescope buffers<cr>', nore) -- buffers
vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope live_grep<cr>', nore) -- live grep
vim.keymap.set('n', leader .. 'uc', '<cmd>Telescope commands<cr>', nore) -- commands
vim.keymap.set('n', leader .. 'uk', '<cmd>Telescope keymaps<cr>', nore) -- keymaps
vim.keymap.set('n', leader .. 'ur', '<cmd>Telescope resume<cr>', nore) -- resume

vim.keymap.set('n', localleader .. 'uy', '<cmd>Telescope git_files<cr>', nore) -- git files
