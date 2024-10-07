-- Harpoon configuration
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<S-h>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<S-l>", function()
	harpoon:list():next()
end)
