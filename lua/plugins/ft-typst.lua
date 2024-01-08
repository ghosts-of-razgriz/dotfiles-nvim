return {
	'kaarmu/typst.vim',
	ft = { 'typst' },
	dependencies = {
		{

			'chomosuke/typst-preview.nvim',
			build = function()
				require('typst-preview').update()
			end,
		},
	},
}
