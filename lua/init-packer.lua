local fn = vim.fn

local pack_path = fn.stdpath 'config' .. '/pack'
local install_path = pack_path .. '/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	local packer_repo = 'https://github.com/wbthomason/packer.nvim'
	local out = fn.system(string.format('git clone %s %s', packer_repo, install_path))
	print(out)
	print('Packer download, need to restart neovim')
	vim.fn.input 'Press ENTRE to quit, and then start neovim'
	vim.cmd [[quit]]
end

fn.system 'packadd packer.nvim'

vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = { 'plugins.lua' },
	command = 'source <afile>',
	group = vim.api.nvim_create_augroup('PackerRefresh', { clear = true }),
})

local packer = require 'packer'
packer.init { package_root = pack_path }
