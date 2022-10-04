local neovim_lsp = require('lspconfig')
local keybinding = require('lsp.keybinding')

vim.cmd("sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=")
vim.cmd("sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=")

neovim_lsp.gopls.setup{ on_attach = keybinding }
neovim_lsp.solargraph.setup{ on_attach = keybinding }
neovim_lsp.vimls.setup{ on_attach = keybinding }
require('lsp.sumneko')
require('lsp.eslint')
require('lsp.goimports')

