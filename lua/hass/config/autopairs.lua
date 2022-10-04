require('nvim-autopairs').setup {
	check_ts = true,
}

require('nvim-treesitter.configs').setup {
	autopairs = { enable = true },
}

require('nvim-autopairs.completion.compe').setup {
	map_cr = true,
	map_complete = true,
}
