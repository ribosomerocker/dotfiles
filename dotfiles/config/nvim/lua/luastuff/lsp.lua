local function on_attach()
    -- me neither tbh. I guess I should TODO this. There.
end

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyls.setup{ on_attach=on_attach }
require'lspconfig'.gopls.setup{ on_attach=on_attach }
require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
require'lspconfig'.ccls.setup{ on_attach=on_attach }
require'lspconfig'.rls.setup{ on_attach=on_attach }

