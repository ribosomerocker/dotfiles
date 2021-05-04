local function on_attach()
    -- me neither tbh. I guess I should TODO this. There.
end

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

-- Credit to Soviet Kitsune#3870 on Discord for this snippet
local config = require 'lspconfig'

local servers = { 'pyls', 'gopls', 'rust_analyser', 'ccls', 'rls' }

for i = 1, #servers do
  local server = servers[i]
  config[server].setup { on_attach = on_attach }
end
