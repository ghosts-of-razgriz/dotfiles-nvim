-- load or install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath('config') .. '/pack'
local install_path = pack_path .. '/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end
execute('packadd packer.nvim')


packer = require('packer')
packer.init({
    package_root = pack_path
  })

