local leader = '<leader>'
local localleader = '<localleader>'
local nore = { noremap = true }

vim.keymap.set('n', leader .. 'u<space>', ':Telescope ', noresilent) -- Telescope <prompt>
vim.keymap.set('n', leader .. 'uu', '<cmd>Telescope find_files<cr>', noresilent) -- find files
vim.keymap.set('n', leader .. 'ut', '<cmd>Telescope<cr>', noresilent) -- Telescope commands
vim.keymap.set('n', leader .. 'ub', '<cmd>Telescope buffers<cr>', noresilent) -- buffers
vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope live_grep<cr>', noresilent) -- live grep
vim.keymap.set('n', leader .. 'uc', '<cmd>Telescope commands<cr>', noresilent) -- commands
vim.keymap.set('n', leader .. 'uk', '<cmd>Telescope keymaps<cr>', noresilent) -- keymaps
vim.keymap.set('n', leader .. 'ur', '<cmd>Telescope resume<cr>', noresilent) -- resume

vim.keymap.set('n', localleader .. 'uy', '<cmd>Telescope git_files<cr>', noresilent) -- git files
