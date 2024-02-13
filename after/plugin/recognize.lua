local commnet = require("comment_and_format")
commnet.setup({{ filetype = "lua", comment_symbol = "--", formatter = ""},
              { filetype = "python", comment_symbol = "#", formatter = "autopep8 -i %"},
              { filetype = "cs", comment_symbol = "\\/\\/", formatter = "dotnet csharpier %"}})

function setKeyBind()
    vim.keymap.set('x', '<leader>c', ':s/^/'..commnet.setupNeovimForFileType().comment_symbol..'<CR>:noh<CR>')
    vim.keymap.set({'n', 'x', 'i'}, '<C-f><C-s>' , '<C-c>:!'..commnet.setupNeovimForFileType().formatter..'<CR><CR>')
    vim.keymap.set('x', '<leader>uc', ':s/^'..commnet.setupNeovimForFileType().comment_symbol..'/<CR>:noh<CR>')
end

vim.api.nvim_exec([[
    augroup FileTypeDetection
        autocmd!
        autocmd BufRead,BufNewFile,BufEnter * lua setKeyBind()
    augroup END
]], false)
