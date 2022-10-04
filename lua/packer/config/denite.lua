if vim.fn.executable('rg') then
  vim.call('denite#custom#var', 'file/rec', 'command', {'rg', '--files', '--hidden', '--glob', '!.git'})
  vim.call('denite#custom#var', 'grep', 'command', {'rg', '--threads', '1'})
  vim.call('denite#custom#var', 'grep', 'recursive_opts', {})
  vim.call('denite#custom#var', 'grep', 'final_opts', {})
  vim.call('denite#custom#var', 'grep', 'separator', {'--'})
  vim.call('denite#custom#var', 'grep', 'default_opts', {'-i', '--vimgrep', '--no-heading'})
end

vim.call('denite#custom#option', 'default', {
    cursor_shape = true,
    cursor_wrap = true,
    prompt = ' ',
    split = 'floating',
    start_filter = true,
    unique = true,
  })

vim.call('denite#custom#filter', 'matcher_ignore_globs', 'ignore_globs', {'.git/'})

                            -- *denite-option-highlight-filter-background*
-- -highlight-filter-background
		-- Change backgroud color group in floating filter window.
		-- Default: "NormalFloat"

					-- *denite-option-highlight-matched-char*
-- -highlight-matched-char
		-- Matched characters highlight.
		-- Default: "None"

				-- *denite-option-highlight-matched-range*
-- -highlight-matched-range
		-- Matched range highlight.
		-- Default: "Underlined"

					-- *denite-option-highlight-preview-line*
-- -highlight-preview-line
		-- Previewed line highlight.
		-- Default: "Search"

					-- *denite-option-highlight-prompt*
-- -highlight-prompt
		-- Prompt highlight in filter window.
		-- Default: "Special"

                            -- *denite-option-highlight-window-background*
-- -highlight-window-background
		-- Change backgroud color group in floating window.
		-- Default: "NormalFloat"

