local M = {}

M.setup = function()
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
        return
    end

    bufferline.setup {
        options = {
            --[[ sort_by = "relative_directory", ]]
            numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
            right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            indicator = {
                icon = "",
            },
            -- indicator_icon = "▎",
            buffer_close_icon = "",
            -- buffer_close_icon = '',
            modified_icon = "●",
            close_icon = "",
            -- close_icon = '',
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 70,
            max_prefix_length = 70, -- prefix used when a buffer is de-duplicated
            tab_size = 31,
            diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
            diagnostics_indicator = function(count, _level, diagnostics_dict, _context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
                return s
            end,
            diagnostics_update_in_insert = true,
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
            -- separator_style = { " ", " " },
            -- separator_style = { "", "" },
            enforce_regular_tabs = true,
            always_show_bufferline = true,
        },
        -- NOTE: to be rmove" powerline symbols
        --[[ let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''d ]]
    }
end

return M
