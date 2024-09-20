set number
set relativenumber
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set showmode!
set wrap!
set ignorecase
set smartcase
colorscheme torte
:let mapleader = " "
nmap  <leader>pv :Ex<CR>
nmap <leader>h :noh<CR>
xmap <leader>y "+ygv<Esc>:let @"=@0<CR>
xmap <leader>Y "+Y:let @"=@0<CR>
xmap <leader>p "+p
xmap <leader>P "+P
xmap <Tab> >gv'
xmap <S-Tab> <gv'
map! <C-s> <C-c>:w<cr>
xmap <C-K> :m '<-2<CR>gv"
xmap <C-S-UP> :m '<-2<CR>gv"
xmap <C-S-DOWN> :m '>+1<CR>gv"
xmap <C-J> :m '>+1<CR>gv"
"map({'n', 'x'}, '<Del>', '"_d')
"map('n', '<leader><C-t>', ':ToggleTerm<CR>')
"map({'n', 'x'}, '<leader>cl', ':!dos2unix % <CR><CR>')
"map({'n', 'x'}, '<leader>cw', ':!unix2dos % <CR><CR>')

