local lsp_config = require 'lspconfig'
local configs = require 'lspconfig.configs'


if not configs.espx_copilot then
  configs.espx_copilot = {
    default_config = {
      name = 'espx_copilot',
      autostart = true,
      cmd = { 'espx-copilot' },
      filetypes = { 'text', 'rust' },
      root_dir = function()
        return vim.fs.dirname(vim.fs.find({ 'markerfile.txt' }, { upward = true })[1])
      end
    },
  }
end

lsp_config.espx_copilot.setup {}




vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
  local notify = require 'notify'
  notify.setup {
    background_colour = '#000000',
    render = 'wrapped-compact',
    timeoute = 100,
  }
  notify(result.message)
end
return {}
