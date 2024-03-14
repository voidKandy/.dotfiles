require 'custom.options'
require 'custom.keymaps'
-- require 'custom.plugins.espx_lsp'

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'srcery-colors/srcery-vim', as = 'srcery' },
  { 'voldikss/vim-floaterm' },
  { 'rcarriga/nvim-notify' },

  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup {
        options = {
          disabled_filetypes = { 'text', 'markdown' },
        },
      }
    end,
  },

  {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      -- require "custom.plugins.configs.startup"
      require "startup".setup()
    end,
  },

  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }
    end,
  },

  { 'mbbill/undotree' },

  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          svelte = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          graphql = { 'prettier' },
          go = { 'gofumpt' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      }
    end,
    after = 'nvim-treesitter',
  },

  { 'folke/neodev.nvim' },
}
