local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader>u<space>', ':Telescope ', { noremap = true })
set_keymap('n', '<leader>uu', '<cmd>Telescope find_files<cr>', opts)
set_keymap('n', '<localleader>uu', '<cmd>Telescope git_files<cr>', opts)
set_keymap('n', '<leader>ut', '<cmd>Telescope<cr>', opts)
set_keymap('n', '<leader>ub', '<cmd>Telescope buffers<cr>', opts)
set_keymap('n', '<leader>ub', '<cmd>Telescope buffers<cr>', opts)
set_keymap('n', '<leader>ug', '<cmd>Telescope live_grep<cr>', opts)
set_keymap('n', '<leader>uc', '<cmd>Telescope commands<cr>', opts)
set_keymap('n', '<leader>uk', '<cmd>Telescope keymaps<cr>', opts)

-- lsp
-- set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
set_keymap('n', 'gk', '<cmd>Telescope lsp_references<cr>', opts)
set_keymap('n', 'gK', '<cmd>Telescope grep_string<cr>', opts)
-- set_keymap('n', 'ge', '<cmd>Telescope lsp_document_diagnostics<cr>', opts)
-- set_keymap('n', 'gE', '<cmd>Telescope lsp_workspace_diagnostics<cr>', opts)
set_keymap('n', '<leader>uo', '<cmd>Telescope lsp_document_symbols<cr>', opts)
set_keymap('n', '<localleader>uo', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
