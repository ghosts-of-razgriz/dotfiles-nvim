-- load or install packer
local fn = vim.fn

local pack_path = fn.stdpath 'config' .. '/pack'
local install_path = pack_path .. '/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	local packer_repo = 'https://github.com/wbthomason/packer.nvim'

	local out = fn.system(string.format('git clone %s %s', packer_repo, install_path))

	print(out)
	print 'Packer downloaded'
end
fn.system 'packadd packer.nvim'

local packer = require 'packer'
packer.init { package_root = pack_path }
