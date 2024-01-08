return {
	'sheerun/vim-polyglot',
	init = function()
		vim.g.polyglot_disabled = { 'autoindent', 'ftdetect' }
	end,
}
