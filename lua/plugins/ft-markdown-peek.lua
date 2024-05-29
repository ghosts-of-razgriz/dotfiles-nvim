return {
	'toppair/peek.nvim',
	cmd = { 'PeekOpen', 'PeekClose' },
	build = 'deno task --quiet build:fast',
	config = function()
		require('peek').setup({
			auto_load = false,
		})
	end,
	init = function()
		vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
		vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
	end,
}
