-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------
-- Normal mode --
-----------------

-- netrw
-- vim.keymap.set('n', '<Leader>e', ':E <CR>', opts)

-- oil
vim.keymap.set('n', '<Leader>e', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- splits
vim.keymap.set('n', '<Leader>vs', ':vspl<CR>')
vim.keymap.set('n', '<Leader>hs', ':spl<CR>')

-- Treesitter builtins
vim.keymap.set('n', '<Leader>tsi', ':InspectTree<CR>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Floaterm
-- NEEDS SOME CONFIG
vim.keymap.set('n', '<Leader>tg', ':FloatermNew lazygit <CR>')
vim.keymap.set('n', '<Leader>tf', ':FloatermToggle <CR>')

-- Glow markdown viewer
vim.keymap.set('n', '<Leader>tm', function()
  local current_filename = vim.fn.expand('%:p')
  if string.find(current_filename, ".md") then
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    vim.cmd(string.format('term glow %s', current_filename))
  else
    print("Current file is not markdown :(")
  end
end)

-- undotree
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)

-- Move chunks
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Keep cursor in its place when doing certain things
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'u', 'uzz')
vim.keymap.set('n', '<C-r>', '<C-r>zz')

-- Don't lose clipboard when leader pasting
vim.keymap.set('x', '<Leader>p', [["_dP]])
-- Leader yank is to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Quickfix nav
vim.keymap.set('n', '<C-K>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-J>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.keymap.set('n', '<leader>th', ':Telescope colorscheme<CR>')
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-----------------
-- Insert mode --
-----------------
--
--
--
-----------------
--    Other    --
-----------------

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
