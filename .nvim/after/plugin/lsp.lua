require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pylsp', 'gopls', 'lua_ls', 'rust_analyzer', 'tsserver', 'cssls' },
})


local cmp = require('cmp')
local lsp_zero = require('lsp-zero')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})


-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer
local lspconfig = require('lspconfig')

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>of', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>sl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<Leader>hi', vim.lsp.inlay_hint.get(bufnr), bufopts)
    -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<Leader>gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
end

lsp_zero.on_attach(on_attach)


lsp_zero.new_client({
    name = 'espx-copilot',
    autostart = 'true',
    cmd = { 'espx-copilot' },
    filetypes = { 'html', 'text', 'rust' },
    root_dir = function()
        return lsp_zero.dir.find_first({ 'markerfile.txt' })
    end
})


lsp_zero.setup_servers({ 'tsserver', 'rust_analyzer', "cssls", "lua_ls", "html", "pylsp", "svelte", "gopls", "htmx",
    "espx-copilot",
})


-- Espx Client stuff
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
    local notify = require("notify")
    notify.setup({
        background_colour = "#000000",
        render = "wrapped-compact",
        timeoute = 100,
    })
    -- Call the function to show the floating window
    -- EspxCopilotWindow()

    local function keysToString(tbl)
        local keyString = ""
        for key, _ in pairs(tbl) do
            keyString = keyString .. key .. ", "
        end
        -- Remove the trailing comma and space
        keyString = keyString:gsub(", $", "")
        return keyString
    end

    notify(result.message)
end
