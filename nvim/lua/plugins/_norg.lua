local M = {}

M.setup = function()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
        },
      },
      ["core.concealer"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
    ["external.kanban"] = {},
  }
end

return M
