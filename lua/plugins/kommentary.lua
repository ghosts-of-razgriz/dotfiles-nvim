return {
	'b3nj5m1n/kommentary',
	keys = 'gc',
	config = function()
		local k = require('kommentary.config')

		k.configure_language('default', {
			prefer_single_line_comments = true,
		})
	end,
}
