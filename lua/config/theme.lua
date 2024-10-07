vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


-- Function to toggle between light and dark mode
function ToggleTheme()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
    vim.cmd("colorscheme gruvbox") -- Ensure Gruvbox is applied after toggling
end

-- Keymap to toggle theme
vim.keymap.set('n', '<leader>tt', ToggleTheme, { noremap = true, silent = true })
