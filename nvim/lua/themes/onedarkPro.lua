local M = {}

function M.setup()
    local ondDarkPro = require "onedarkpro"
    ondDarkPro.setup {
        colors = {
            onelight = {
                bg = "#f5f5f5", -- green
            },
        }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
        plugins = { -- Override which plugins highlight groups are loaded
            all = false,
        },

        styles = {
            comments = "italic",
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold", -- styles can be a comma separated list
        },

        options = {
            bold = true, -- Use the themes opinionated bold styles?
            italic = true, -- Use the themes opinionated italic styles?
            underline = true, -- Use the themes opinionated underline styles?
            undercurl = true, -- Use the themes opinionated undercurl styles?
            cursorline = true, -- Use cursorline highlighting?
            transparency = false, -- Use a transparent background?
            terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
            highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
        },

        highlights = {
            -- Commend line groups
            PmenuSel = { bg = "#282C34", fg = "NONE" },
            Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
            NormalFloat = { fg = "#C5CDD9", bg = "${bg}" },
            --[[ IncSearch = { fg = "#EED8DA", cterm = "${red}" }, ]]

            -- Fold groups
            Folded = { bg = "#30363d", fg = "" }, -- line used for closed folds
            FoldedNC = { bg = "#30363d", fg = "#D4A959" }, -- Folded for inactive windows
            FoldColumn = { bg = "", fg = "#FFFFFF" }, -- 'foldcolumn on the line numbers'

            FloatBorder = { fg = "#61afef" },
            TelescopeBorder = { fg = "#61afef" },
            TelescopePromptBorder = { fg = "#61afef" },
            TelescopePreviewBorder = { fg = "#61afef" },
            VertSplit = { fg = "${purple}" },
            TSProperty = { fg = (vim.o.background == "dark" and "${white}" or "${black}") },
            TSTagAttribute = { fg = "${purple}" },
            LspDiagnosticsDefaultWarning = { fg = "${white}", bg = "${yellow}" },

            --[[ UfoFoldedBg = {bg= "#58B5A8"}, ]]
            --[[ UfoFoldedFg = {fg= "#58B5A8"} ]]
            --[[ CmpDocumentation = {
            bg = "#61afef",
            fg = "#61afef",
        },]]
        },
    }
    vim.cmd [[set background=dark]]
    vim.cmd "colorscheme onedark_vivid"
end

return M
