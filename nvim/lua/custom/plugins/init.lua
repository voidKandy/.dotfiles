require 'custom.options'
require 'custom.keymaps'

return {
  require 'custom.plugins.configs.telescope',
  require 'custom.plugins.configs.colors',
  require 'custom.plugins.configs.lsp',
  require 'custom.plugins.configs.oil',

  { 'mbbill/undotree' },
  { 'voldikss/vim-floaterm' },
  { 'rcarriga/nvim-notify' },
  { 'nvim-treesitter/nvim-treesitter-context' },

  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup {
        options = {
          disabled_filetypes = { 'text' },
        },
      }
    end,
  },

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
          -- markdown = { 'prettier' },
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
}
