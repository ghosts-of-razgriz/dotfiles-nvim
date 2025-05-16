return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	dependencies = { 'xzbdmw/colorful-menu.nvim' },
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = 'default',
			['<C-space>'] = {},
		},

		appearance = {
			nerd_font_variant = 'mono',
		},

		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					columns = { { 'kind_icon' }, { 'label', gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require('colorful-menu').blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require('colorful-menu').blink_components_highlight(ctx)
							end,
						},
					},
				},
				scrollbar = false,
			},
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = { implementation = 'prefer_rust_with_warning' },
	},
	opts_extend = { 'sources.default' },
}
