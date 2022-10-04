-- load or install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath('config') .. '/pack'
local install_path = pack_path .. '/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end
execute('packadd packer.nvim')

local packer = require('packer')
packer.init({
	package_root = pack_path
})

vim.cmd [[command! PackerSync lua require('packer').sync()]]

-- check or install the python3 neovim plugin
if fn.has('python3') ~= 1 then
	execute('!pip3 install --user neovim')
end

-- set python3 path to speedup startup
local python3_path = '/usr/local/bin/python3'
if fn.filereadable(python3_path) ~= 1 then
  vim.g.python_host_prog = python3_path
end

-- check or install the ruby neovim plugin
if fn.has('ruby') ~= 1 then
  execute('!gem install neovim')
end

-- check or install the node neovim plugin
if fn.has('node') ~= 1 then
  execute('!yarn global add neovim')
end

