local M = {}

M.setup = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup {
        ensure_installed = "all",      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false,          -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
        autopairs = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        highlight = {
            enable = true,    -- false will disable the whole extension
            disable = { "" }, -- list of language that will be disabled
            additional_vim_regex_highlighting = true,
        },
        indent = { enable = true },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        rainbow = { enable = true, extended_mode = true },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },
    }
end

return M
