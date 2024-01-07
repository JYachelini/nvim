local harpoon = require("harpoon")
local wk = require("which-key")

-- REQUIRED
harpoon:setup()

-- vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)

wk.register({
    ["<leader>"] = {
        a = { function() harpoon:list():append() end, "Save file to harpoon" },
    },
    ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Open harpoon" },
    ["<S-h>"] = { function() harpoon:list():prev() end, "Go to prev harpoon file" },
    ["<S-l>"] = { function() harpoon:list():next() end, "Go to next harpoon file" },
}, {  mode = "n" })

