local opts = {  noremap = true }

vim.api.nvim_set_keymap('n', '<leader>vo', ':VtrOpenRunner<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>va', ':VtrAttachToPane<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>vv', ':VtrSendCommand<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>v<space>', ':VtrSendCommand<space>', opts)
vim.api.nvim_set_keymap('n', '<leader>vx', ':VtrKillRunner<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>vd', ':VtrSendCtrlD<cr>', opts)

-- " toggele clear before send
-- nnoremap <silent><leader>vt             :call VtrToggleClearBeforeSend()<cr>

-- function! VtrToggleClearBeforeSend() abort
--   if g:VtrClearBeforeSend == 0
--     let g:VtrClearBeforeSend = 1
--     echo 'VtrClearBeforeSend Set'
--   else
--     let g:VtrClearBeforeSend = 0
--     echo 'VtrClearBeforeSend Unset'
--   endif
-- endfunction

function _G.vtr_toggle_clear_before_send()
	if vim.api.nvim_eval('g:VtrClearBeforeSend') == 0 then
		vim.g.VtrClearBeforeSend = 1
		vim.api.nvim_notify('VtrClearBeforeSend Set', 1, {})
	else
		vim.g.VtrClearBeforeSend = 0
		vim.api.nvim_notify('VtrClearBeforeSend Unset', 1, {})
	end
end

vim.api.nvim_set_keymap('n', '<leader>vc', ":call v:lua.vtr_toggle_clear_before_send()<cr>", opts)
