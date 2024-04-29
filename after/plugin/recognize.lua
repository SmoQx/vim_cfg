local comment = require("comment_and_format")
comment.setup({{ filetype = "lua", comment_symbol = "--", formatter = ""},
              { filetype = "python", comment_symbol = "#", formatter = "autopep8 -i %"},
              { filetype = "cs", comment_symbol = "\\/\\/", formatter = "dotnet csharpier %"},
              { filetype = "c", comment_symbol = "\\/\\/", formatter = ""}})

function setKeyBind()
    vim.keymap.set('x', '<leader>c', ':s/^/'..comment.setupNeovimForFileType().comment_symbol..'<CR>:noh<CR>')
    vim.keymap.set({'n', 'x', 'i'}, '<C-f><C-s>' , '<C-c>:!'..comment.setupNeovimForFileType().formatter..'<CR><CR>')
    vim.keymap.set('x', '<leader>uc', ':s/^'..comment.setupNeovimForFileType().comment_symbol..'/<CR>:noh<CR>')
end

vim.api.nvim_exec([[
    augroup FileTypeDetection
        autocmd!
        autocmd BufRead,BufNewFile,BufEnter * lua setKeyBind()
    augroup END
]], false)
