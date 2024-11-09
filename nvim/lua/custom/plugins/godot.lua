local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lua").default_capabilities())
require("lspconfig").gdscript.setup(capabilities)

return {
  { 'lommix/godot.nvim' }
}
