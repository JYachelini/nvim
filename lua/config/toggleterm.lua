-- Toggleterm configuration
require("toggleterm").setup({
    size = 10,
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    close_on_exit = true,
})

vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
