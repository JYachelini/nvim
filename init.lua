require("plugins")
require("set")
require("remap")

local config_dir = vim.fn.stdpath("config") .. "/lua/config/"

local function load_configs()
    local files = vim.fn.glob(config_dir .. "*.lua", true, true)
    for _, file in ipairs(files) do
        local module = file:match("^.+/(.+)%.lua$")
        if module then
            require("config." .. module)
        end
    end
end

-- Load all configurations
load_configs()
