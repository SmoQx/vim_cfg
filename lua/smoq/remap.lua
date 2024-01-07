vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.nohls)
vim.keymap.set('x', '<leader>y', '"+ygv<Esc><cmd>let @"=@0<CR>')
vim.keymap.set('x', '<leader>Y', '"+Y<cmd>let @"=@0<CR>')
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'x'}, '<leader>P', '"+P')
vim.keymap.set({'n', 'x'}, '<Tab>' , '>gv')
vim.keymap.set({'n', 'x'}, '<S-Tab>' , '<gv')
vim.keymap.set({'n', 'x', 'i'}, '<C-s>' , '<C-c>:w<cr>')
vim.keymap.set({'n', 'x', 'i'}, '<C-f><C-s>' , '<C-c>:!dotnet csharpier . <CR>:w<CR>')
vim.keymap.set('x', '<C-K>', ":m '<-2<CR>gv")
vim.keymap.set('x', '<C-S-UP>', ":m '<-2<CR>gv")
vim.keymap.set('x', '<C-J>', ":m '>+1<CR>gv")
vim.keymap.set('x', '<C-S-DOWN>', ":m '>+1<CR>gv")
vim.keymap.set({'n', 'x'}, '<Del>', '"_d')
vim.keymap.set('n', '<leader><C-t>', ':ToggleTerm<CR>a')
vim.keymap.set('x', '<leader>c', ':s/^/#<CR>:noh<CR>')
vim.keymap.set({'n', 'x'}, '<leader>cl', ':!dos2unix % <CR><CR>')
vim.keymap.set({'n', 'x'}, '<leader>cw', ':!unix2dos % <CR><CR>')
