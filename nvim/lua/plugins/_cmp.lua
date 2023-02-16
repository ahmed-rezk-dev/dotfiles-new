local M = {}

M.setup = function()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
        return
    end

    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    -- cmp in cmdline is a WIP - I mostly use telescope to navigate anyway
    -- `/` cmdline setup.
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        },

        window = {
            completion = {
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                col_offset = -3,
                side_padding = 0,
            },
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 } (entry, vim_item)
                local strings = vim.split(kind.kind, "%s", { trimempty = true })
                kind.kind = " " .. strings[1] .. " "
                kind.menu = "    (" .. strings[2] .. ")"

                --[[ cmp_tabnine ]]
                if entry.source.name == "cmp_tabnine" then
                    local detail = (entry.completion_item.data or {}).detail
                    kind.kind = " "
                    kind.menu = "    ( AI )"
                    if detail and detail:find ".*%%.*" then
                        vim_item.kind = vim_item.kind .. " " .. detail
                    end
                end

                return kind
            end,
        },

        sources = {
            --[[ { name = "nvim_lsp" }, ]]
            {
                name = "nvim_lsp",
                entry_filter = function(entry, ctx)
                    return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                end,
            },
            { name = "treesitter" },
            { name = "cmp_tabnine" },
            { name = "luasnip" },
            { name = "path" },
            { name = "spell" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "look" },
            { name = "calc" },
            { name = "emoji" },
            { name = "vsnip" },
            { name = "nvim_lsp_signature_help" },
            { name = "git" },
        },

        --[[ sources = source_filter(), ]]

        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },

        experimental = {
            ghost_text = false,
            native_menu = false,
        },
    }
end

return M
