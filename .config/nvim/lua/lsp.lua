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
        })
}

nls.setup({ sources = sources })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local default = {
  on_attach = on_attach, autostart = true, capabilities = capabilities
}

local configs = {
    clangd = { on_attach = on_attach, root_dir = function() return vim.loop.cwd() end, capabilities = capabilities },
    pylsp = default,
    gopls = default,
    rust_analyzer = default,
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
