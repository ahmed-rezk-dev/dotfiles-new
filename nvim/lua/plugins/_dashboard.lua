local M = {}

M.setup = function()
    require("dashboard").setup {
        theme = "hyper",
        config = {
            week_header = {
                enable = true,
            },
            disable_move = false,
            shortcut = {
                { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "FzfLua files",
                    key = "f",
                },
                {
                    desc = " Apps",
                    group = "DiagnosticHint",
                    action = "Lazy show",
                    key = "a",
                },
                {
                    desc = " Sessions",
                    group = "Error",
                    action = "SearchSession",
                    key = "s",
                },
            },
        },
    }
end

return M
