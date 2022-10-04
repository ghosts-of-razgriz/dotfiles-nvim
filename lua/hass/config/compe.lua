vim.opt.completeopt = 'menuone,noselect'

require('compe').setup {
	enabled = true,
	autocomplete = true,
	min_length = 1,
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
	},
}
