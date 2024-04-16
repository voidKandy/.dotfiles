require 'custom.options'
require 'custom.keymaps'

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'custom.plugins.configs.telescope',
  require 'custom.plugins.configs.colors',
  require 'custom.plugins.configs.lsp',
  require 'custom.plugins.configs.oil',

  { 'mbbill/undotree' },
  { 'voldikss/vim-floaterm' },
  { 'rcarriga/nvim-notify' },
  { 'nvim-treesitter/nvim-treesitter-context',
    require 'treesitter-context'.setup {
      enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
  },

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
