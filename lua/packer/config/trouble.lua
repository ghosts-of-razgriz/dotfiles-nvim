require('trouble').setup{
  height = 3,
  auto_open = false,
  auto_close = true,
  use_lsp_diagnostic_signs = true,
}

local settings = {  noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>gt', ':TroubleToggle<cr>', settings)
