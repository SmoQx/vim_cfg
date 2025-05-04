return{
  'akinsho/toggleterm.nvim', version = "*", config = function()
        require("toggleterm").setup({
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
        })
}
