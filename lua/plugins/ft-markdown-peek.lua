return {
	'toppair/peek.nvim',
	enabled = function()
		local neovim_build = os.getenv('NEOVIM_BUILD')
		if neovim_build then
			return false
		else
			return true
		end
	end,
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
