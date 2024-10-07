-- Autopairs setup
require("nvim-autopairs").setup({
    check_ts = true, -- Enable Treesitter integration for better handling of pairs
})

-- Integration with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
