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
    event = "InsertEnter *",
    run = ":UpdateRemotePlugins",
    requires = {
      'Shougo/context_filetype.vim',
      'Shougo/deoplete-lsp',
      {
        'neovim/nvim-lspconfig',
        config = function()
          require 'packer.lsp'
        end
      }
    }
  }

  use {
    'Shougo/denite.nvim',
    cmd = 'Denite',
    config = function()
      require 'packer.denite'
    end,
    setup = function()
      local settings = {  noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<leader>uu', ':Denite file/rec<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>uu', ':Denite directory_rec<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>ub', ':Denite buffer<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>ur', ':Denite -resume<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>uh', ':Denite help<cr>', settings)
    end,
    run = ":UpdateRemotePlugins",
  }

  use {
    'Shougo/defx.nvim',
    cmd = 'Defx',
    config = function()
      require 'packer.defx'
    end,
    setup = function()
      local settings = {  noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<leader>e', ':Defx -buffer-name=defx -show-ignored-files<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>e', ":Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>", settings)
    end,
    run = ":UpdateRemotePlugins",
    requires = {'kristijanhusak/defx-git', {
        'kristijanhusak/defx-icons',
        config = function()
          vim.g.defx_icons_enable_syntax_highlight = 1
          vim.g.defx_icons_column_length = 2
          vim.g.defx_icons_directory_icon = ''
          vim.g.defx_icons_mark_icon = '✓'
          vim.g.defx_icons_parent_icon = ''
          vim.g.defx_icons_default_icon = ''
          vim.g.defx_icons_directory_symlink_icon = ''
          vim.g.defx_icons_root_opened_tree_icon = ''
          vim.g.defx_icons_nested_opened_tree_icon = ''
          vim.g.defx_icons_nested_closed_tree_icon = ''
        end,
    }}
  }

  use {'jiangmiao/auto-pairs', event = 'InsertEnter *'}

  use {'godlygeek/tabular', cmd = {'Tab', 'Tabularize'}}

  use {
    'tpope/vim-fugitive',
    cmd = {
      'Gblame', 'Gcommit', 'Gdiff', 'Gedit', 'Gfetch', 'Git', 'Gpull', 'Gpush',
      'Gstatus', 'Gwrite'
    },
    setup = function()
      local settings = { noremap = true }
      vim.api.nvim_set_keymap('n', '<leader>ga',       ':Git add --patch<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gb',       ':Gblame<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gc',       ':Gcommit<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gd',       ':Gdiff<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gf',       ':Gfetch<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gg',       ':Git<space>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gk',       ':Git checkout<space>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gl',       ':Gpull<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gp',       ':Gpush<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gs',       ':Gstatus<cr><c-w><s-h>', settings)
      vim.api.nvim_set_keymap('n', '<leader>gw',       ':Gwrite<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>gc',  ':Gcommit --amend<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>gw',  ':Git add --patch %<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>ge',       ':Gedit<space>', settings)
    end,
    -- requires = {{'junegunn/gv.vim', cmd = {'GV', 'GV!', 'GV?'}}}
  }

  use {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious'
    },
    setup = function()
      vim.g.tmux_navigator_no_mappings = 1

      local settings = {silent = true, noremap = true}
      vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', settings)
      vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', settings)
      vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', settings)
      vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', settings)
    end
  }

  use {
    'christoomey/vim-system-copy',
    keys = {'cp', 'cP'}
  }
end)
