
local wk = require("which-key")

-- ToggleTerminal
wk.register({
    ["<leader>"] = {
        t = { ":ToggleTerm size=10<CR>", "Toggle terminal" },
    },
})
