return {
	'saghen/blink.pairs',
	build = 'cargo build --release',
	opts = {
		mappings = {
			enabled = true,
		},
		highlights = {
			enabled = true,
			groups = {
				'BlinkPairsOrange',
				'BlinkPairsPurple',
				'BlinkPairsBlue',
			},
			matchparen = {
				enabled = true,
				group = 'MatchParen',
			},
		},
		debug = false,
	},
}
