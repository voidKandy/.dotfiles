local lsp_config = require 'lspconfig'
local configs = require 'lspconfig.configs'


vim.filetype.add({
  extension = {
    surql = "surql",
    templ = "templ",
  }
})


local find_rust_bin = function()
  return '~/Documents/GitHub/surrealql-lsp/target/debug/surrealql-lsp-server'
end


if not configs.surrealql_lsp then
  configs.surrealql_lsp = {
    default_config = {
      name = 'surrealql-lsp-server',
      filetypes = { 'surql' },
      cmd = { 'surrealql-lsp-server' },
      autostart = true,
      root_dir = function()
        return vim.fn.getcwd()
      end
    },
  }
end

lsp_config.surrealql_lsp.setup {

}

return {}
