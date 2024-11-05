return {
	'chomosuke/typst-preview.nvim',
	ft = { 'typst' },
	build = function()
		require('typst-preview').update()
	end,
	config = function()
		require('typst-preview').setup({
			debug = false,
		})
	end,
}
