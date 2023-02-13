local M = {}

local keymap = vim.keymap

M.setup = function()
  local possession = require "nvim-possession"
  possession.setup {

    autoload = false, -- whether to autoload sessions in the cwd at startup
    autosave = true, -- whether to autosave loaded sessions before quitting
    autoswitch = {
      enable = false, -- whether to enable autoswitch
      exclude_ft = {}, -- list of filetypes to exclude from autoswitch
    },

    fzf_winopts = {
      -- any valid fzf-lua winopts options, for instance
      width = 0.5,
      preview = {
        vertical = "right:30%",
      },
    },
  }

  --[[ Keymaps ]]
  keymap.set("n", "<leader>sl", function()
    possession.list()
  end)
  keymap.set("n", "<leader>sn", function()
    possession.new()
  end)
  keymap.set("n", "<leader>su", function()
    possession.update()
  end)
end

return M
