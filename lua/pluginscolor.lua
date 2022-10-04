local packer = require('packer')

packer.use { 'dracula/vim', as = 'dracula', config = "vim.cmd('colorscheme dracula')" }
packer.use { 'arcticicestudio/nord-vim', disable = true }
packer.use { 'challenger-deep-theme/vim', disable = true }
packer.use { 'cocopon/iceberg.vim', disable = true }
