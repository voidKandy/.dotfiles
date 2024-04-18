return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.


    -- RUN :hi to look at groups!
    vim.cmd.colorscheme 'tokyonight-moon'
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
    vim.cmd.hi 'LineNr term=bold ctermfg=white guifg=grey'
    -- BELOW MAKES BACKGROUND TRANSPARENT
    vim.cmd.hi 'Normal ctermbg=NONE guibg=NONE'
    vim.cmd.hi 'NormalNC ctermbg=NONE guibg=NONE'

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  end,
}
