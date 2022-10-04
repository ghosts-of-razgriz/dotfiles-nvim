local fn = vim.fn

local pack_path = fn.stdpath 'config' .. '/pack'
local install_path = pack_path .. '/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	local packer_repo = 'https://github.com/wbthomason/packer.nvim'

	local out = fn.system(string.format('git clone %s %s', packer_repo, install_path))
	print(out)
	print 'Packer downloaded, need to restart neovim'
	vim.fn.input 'Press ENTER to quit, and then start neovim'
	vim.cmd [[quit]]
end

fn.system 'packadd packer.nvim'

vim.cmd [[
	augroup PackerResource
		autocmd BufWritePost plugins.lua :luafile %
	augroup END
]]

local packer = require 'packer'
packer.init { package_root = pack_path }
