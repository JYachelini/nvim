local wk = require("which-key")

wk.register({
    ["<leader>g"] = { name = "Git", s = { vim.cmd.Git, "Open git buffer" } },
}, { mode = "n" })

-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
