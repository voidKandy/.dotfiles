-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'srcery-colors/srcery-vim', as = 'srcery', }
    -- :TransparentEnable
    -- :TransparentDisable
    -- :TransparentToggle
    use 'xiyaowong/transparent.nvim'
    use 'vim-airline/vim-airline'
    use { 'vim-airline/vim-airline-themes',
        config = function()
            vim.cmd("AirlineTheme base16_gruvbox_dark_soft")
            -- dues
            -- more themes @ https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themes
        end,
        after = "vim-airline"
    }

    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use 'mbbill/undotree'

    use { "terrortylor/nvim-comment",

        config = function()
            require('nvim_comment').setup({
                -- Linters prefer comment and line to have a space in between markers
                marker_padding = true,
                -- should comment out empty or whitespace only lines
                comment_empty = true,
                -- trim empty comment whitespace
                comment_empty_trim_whitespace = true,
                -- Should key mappings be created
                create_mappings = true,
                -- Normal mode mapping left hand side
                line_mapping = "gcc",
                -- Visual/Operator mapping left hand side
                operator_mapping = "gc",
                -- text object mapping, comment chunk,,
                hook = nil
            })
        end
    }

    use 'ThePrimeagen/harpoon'

    use {
        'm4xshen/autoclose.nvim',
        require("autoclose").setup({
            options = {
                disabled_filetypes = { "text", "markdown" },
            },
        })
    }

    -- Telescope stuff
    use "nvim-lua/plenary.nvim"
    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } },
        require('telescope').setup {
            file_ignore_patterns = { "*/netrw/*" }
        }
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    svelte = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    graphql = { "prettier" },
                    go = { "gofumpt" }
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                },
            })
        end,
        after = "nvim-treesitter"
    })

    use { 'folke/neodev.nvim' }

    -- LSP stuff
    -- use { 'williamboman/mason.nvim' }
    -- use { 'williamboman/mason-lspconfig.nvim' }
    -- use { 'neovim/nvim-lspconfig' }
    -- use { 'hrsh7th/nvim-cmp', config = [[require('voidkandy.config.nvim-cmp')]] }
    -- use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    -- use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }  -- buffer auto-completion
    -- use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }    -- path auto-completion
    -- use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
    -- use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }



    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
