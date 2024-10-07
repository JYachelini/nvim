-- Lualine configuration
require("lualine").setup({
    options = {
        theme = "auto",
    },
    sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            { "filename" },
        },
        lualine_x = {
            "encoding", "fileformat", "filetype", "mode"
        },
    },
})
