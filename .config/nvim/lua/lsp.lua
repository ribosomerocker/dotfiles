local function on_attach()
end

local luasnip = require 'luasnip'
local config = require 'lspconfig'
local cmp = require 'cmp'
local nls = require 'null-ls'

require('nvim-autopairs').setup{}
local cmp_ap = require('nvim-autopairs.completion.cmp')

-- set null-ls up for shellcheck
local sources = {
    nls.builtins.diagnostics.shellcheck.with({
            diagnostics_format = "[#{c}] #{m} (#{s})"
        }),
}

nls.setup({ sources = sources })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local default = {
  on_attach = on_attach, autostart = true, capabilities = capabilities
}

local idrislsp = {
    on_new_config = function(new_config, new_root_dir)
        new_config.capabilities['workspace']['semanticTokens'] = { refreshSupport = true }
    end,

    on_attach = function(client)
        vim.lsp.buf_request(0, 'textDocument/semanticTokens/full', 
                            { textDocuments = vim.lsp.util.make_text_document_params() }, 
                            nil)
    end,

    autostart = true,
    handlers = {
        ['workspace/semanticTokens/full'] = function(err, result, ctx, config)
            local bufnr = ctx.bufnr
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            local legend = client.server_capabilities.semanticTokensProvider.legend
            local token_types = legend.tokenTypes
            local data = result.data

            local ns = vim.api.nvim_create_namespace('nvim-lsp-semantic')
            vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
            local tokens = {}
            local prev_line, prev_start = nil, 0
            for i = 1, #delta, 5 do
                local delta_line = data[i]
                prev_line = prev_line and prev_line + delta_line or delta_line
                local delta_start = data[i + 1]
                prev_start = delta_line == 0 and prev_start + delta_start or delta_start
                local token_type = token_types[data[i + 3] + 1]
                local line = vim.api.nvim_buf_get_lines(bufnr, prev_line, prev_line + 1, false)[1]
                local byte_start = vim.str_byteindex(line, prev_start)
                local byte_end = vim.str_byteindex(line, prev_start + data[i + 2])
                vim.api.nvim_buf_add_highlight(bufnr, ns, 'LspSemantic_' .. token_type, prev_line, byte_start, byte_end)
            end
        end
    },
}

local configs = {
    clangd = { on_attach = on_attach, root_dir = function() return vim.loop.cwd() end, capabilities = capabilities },
    pylsp = default,
    gopls = default,
    rust_analyzer = default,
    hls = default,
    idris2_lsp = idrislsp,
}

for server, opts in pairs(configs) do
   config[server].setup(opts)
end


cmp.setup({
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },
        mapping = {
            ['<C-k>'] = cmp.mapping.scroll_docs(-3),
            ['<C-j>'] = cmp.mapping.scroll_docs(4),
            ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
            }),
            ['<C-d>'] = cmp.mapping.close(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'luasnip' },
            { name = 'treesitter' },
        },
        formatting = {
            format = function(entry, vim_item)
                -- fancy icons and a name of kind

                -- set a name for each source
                vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })[entry.source.name]
                return vim_item
            end,
        },
    })

cmp.event:on( 'confirm_done', cmp_ap.on_confirm_done({ map_char = { tex = '' } }))

-- luasnip config
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
