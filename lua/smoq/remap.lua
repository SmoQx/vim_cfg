vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.nohls)
vim.keymap.set('x', '<leader>y', '"+ygv<Esc><cmd>let @"=@0<CR>')
vim.keymap.set('x', '<leader>Y', '"+Y<cmd>let @"=@0<CR>')
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'x'}, '<leader>P', '"+P')
vim.keymap.set({'n', 'x'}, '<Tab>' , '>gv')
vim.keymap.set({'n', 'x'}, '<S-Tab>' , '<gv')
