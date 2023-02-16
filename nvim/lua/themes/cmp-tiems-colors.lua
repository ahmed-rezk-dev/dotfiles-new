local util = require "themes.custom.util"
local CMP = require "themes.custom.nvim_cmp"

local skeletons = {
    CMP
}

for _, skeleton in ipairs(skeletons) do
    util.initialise(skeleton)
end
