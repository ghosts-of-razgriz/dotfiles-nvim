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
    prompt = '> ',
    split = 'floating',
    start_filter = true,
    unique = true,
  })

vim.call('denite#custom#filter', 'matcher_ignore_globs', 'ignore_globs', {'.git/'})

