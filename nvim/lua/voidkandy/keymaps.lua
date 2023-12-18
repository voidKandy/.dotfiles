-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------

vim.keymap.set("n", "<Leader>so", ":source %<CR>", { desc = "Open parent directory in float" })

-- netrw
-- vim.keymap.set('n', '<Leader>e', ':E <CR>', opts)


-- oil
vim.keymap.set("n", "<Leader>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Leader>e", ":lua require('oil').toggle_float(nil)<CR>", { desc = "Open parent directory in float" })
vim.keymap.set("n", "<Leader>vs", ":vspl<CR>")
vim.keymap.set("n", "<Leader>hs", ":spl<CR>")
vim.keymap.set("n", "<Leader>qw", ":wq<CR>")
vim.keymap.set("n", "<Leader>qq", ":q<CR>")


-- undotree
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)

-- Move chunks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Keep cursor in its place when doing certain things
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "u", "uzz")
vim.keymap.set("n", "<C-r>", "<C-r>zz")

-- Don't lose clipboard when leader pasting
vim.keymap.set("x", "<Leader>p", [["_dP]])
-- Leader yank is to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Quickfix nav
vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fo', builtin.oldfiles, {})

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

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)



-----------------
-- Insert mode --
-----------------
