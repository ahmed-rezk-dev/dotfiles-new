local util = require "themes.custom.util"
C = require "themes.custom.palettes"
Config = require "themes.custom.config"

local CMP = require "themes.custom.nvim_cmp"
local HIGHLIGHTS = require "themes.custom.new-highlights"

local skeletons = {
  CMP,
  --[[ HIGHLIGHTS, ]]
}

for _, skeleton in ipairs(skeletons) do
  util.initialise(skeleton)
end
