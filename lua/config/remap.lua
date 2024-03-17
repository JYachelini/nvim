-- local wk = require("which-key")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-s>", ":w<CR>")


-- wk.register({
--     ["J"] = { ":m '>+1<CR>gv=gv", "Move up lines selected"},
--     ["K"] = { ":m '<-2<CR>gv=gv", "Move down lines selected"},
--     ["<leader>"] = {
--         y = { "\"+y", "Copy selected for both clipboards" },
--         d = { "\"_d", "Delete without copy" },
--     },
-- }, { mode = "v"})
--
-- wk.register({
--     ["<leader>"] = {
--         pv = { vim.cmd.Ex, "Open file explorer" },
--         y = { "\"+y", "Copy line for both clipboards" },
--         Y = { "\"+Y", "Copy line for both clipboards" },
--         d = { "\"_d", "Delete without copy" },
--         f = {
--             name = "Finder",
--             f = { ":vim ", "Find words [regex word] [location]" },
--             l = { ":copen<CR>", "Open list finder" },
--         },
--         s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Change all words in buffer" },
--     },
--     ["J"] = { "mzJ`z", "Join line below to the end" },
--     ["<C-d>"] = { "<C-d>zz", "Move down" },
--     ["<C-u>"] = { "<C-u>zz", "Move up" },
--     ["<C-k>"] = { "<cmd>cnext<CR>zz", "Next word finded" },
--     ["<C-j>"] = { "<cmd>cprev<CR>zz", "Prev word finded" },
--     ["<C-s>"] = { ":w<CR>", "Save file" },
--     ["<C-h>"] = { "<C-w>h<CR>", "Move left buffer" },
--     ["<C-l>"] = { "<C-w>l<CR>", "Move right buffer" },
--     ["n"] = { "n", "Move cursor next word" },
--     ["N"] = { "N", "Move cursor prev word" },
-- }, {  mode = "n" })
--
-- wk.register({
--     ["<leader>"] = {
--         x = { "\"_dp", "Paste without copy" }
--     }
-- }, { mode = "x" })
