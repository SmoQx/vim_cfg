-- Function to setup Neovim based on file type
local function setupNeovimForFileType()
    local filetype = vim.fn.expand('%:e') -- Get file extension

    if filetype == ".py" then
        print(filetype)
    end
end

-- Setup autocmd to detect file type on BufRead and BufNewFile events
vim.api.nvim_exec([[
    augroup FileTypeDetection
        autocmd!
        autocmd BufRead,BufNewFile * call v:lua.setupNeovimForFileType()
    augroup END
]], false)
