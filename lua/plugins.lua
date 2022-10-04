local packer = require('packer')

packer.startup(function(use)
    -- packer managing itself
    use {
        'wbthomason/packer.nvim',
        opt = true,
      }

    -- color schemes
    use {
        'dracula/vim',
        as = 'dracula',
        config = function()
          vim.cmd('colorscheme dracula')
        end
      }
    use {'arcticicestudio/nord-vim', disable = true}
    use {'cocopon/iceberg.vim', disable = true}
    use {'joshdick/onedark.vim', disable = true}

    -- plugins
    use {'sheerun/vim-polyglot'}
    use {'kana/vim-operator-user'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-surround'}
    use {
        'junegunn/vim-peekaboo',
        config = function()
          vim.g.peekaboo_window = 'vertical botright 80new'
        end
      }

    -- lazy plugins
    use {
        'Shougo/deoplete.nvim',
        config = function()
          vim.call('deoplete#enable')
        end,
        setup = function()
          vim.g.loaded_deoplete = 1
        end,
        event = "InsertEnter *",
        run = ":UpdateRemotePlugins",
        requires = {
          'Shougo/context_filetype.vim',
          'Shougo/deoplete-lsp',
          {
            'neovim/nvim-lspconfig',
            config = function()
              require 'plugin.lsp'
            end
          }
        }
      }
  end)

