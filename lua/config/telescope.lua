require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').move_selection_next,
                ["<C-p>"] = require('telescope.actions').move_selection_previous,
            },
        },
    },
}
