vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dp')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true }) -- Save from insert mode

-- Telescope mappings for file search and live grep (word search)

-- Find files in the project
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, { noremap = true, silent = true })

-- Search for words in the project
vim.keymap.set("n", "<leader>ps", require("telescope.builtin").live_grep, { noremap = true, silent = true })

-- Keymap for Go to Definition (LSP)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

-- Keymap for Code Action (trigger a code action)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Keymap for Diagnostics (show diagnostics in line)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Keymap for Rename (rename symbol under cursor)
vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, { noremap = true, silent = true })

-- Keymap for organizing imports
vim.keymap.set("n", "<leader>vco", function()
    vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
    })
end, { noremap = true, silent = true })

vim.keymap.set(
    "n",
    "<leader>bd",
    ':bufdo if bufwinnr(bufnr("%")) == -1 | bdelete | endif<CR>',
    { noremap = true, silent = true }
)
