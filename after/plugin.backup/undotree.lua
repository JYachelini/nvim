local wk = require("which-key")

wk.register({
    ["<leader>u"] = { vim.cmd.UndotreeToggle, "Toggle history changes tree" }
}, { mode = "n" })

-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
