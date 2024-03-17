local wk = require("which-key")


local builtin = require('telescope.builtin')

wk.register({
    ["<leader>"] = {
        p = {
            name = "Telescope Finder",
            f = { builtin.find_files, "Find files" };
            s = { function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end , "Find word in project"}
        }
    },
    ["<C-p>"] = { builtin.git_files, "Open git files" },
}, { mode = "n" })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
