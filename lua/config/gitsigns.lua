-- Gitsigns configuration
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = true, -- Toggle current line blame
  watch_gitdir = {
    interval = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
}

-- Define highlight groups for the git signs (this replaces deprecated hl fields)
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDelete' })

-- You can also set number highlights, if needed:
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDelete' })

-- Define custom keymaps for Gitsigns (as 'keymaps' in the config is no longer valid)
vim.keymap.set('n', ']c', '&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"', { expr = true, noremap = true })
vim.keymap.set('n', '[c', '&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"', { expr = true, noremap = true })
vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line{full=true}<CR>')
vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
vim.keymap.set('n', '<leader>hD', '<cmd>Gitsigns diffthis("~")<CR>')


