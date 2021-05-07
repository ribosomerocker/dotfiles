local function on_attach()
    -- me neither tbh. I guess I should TODO this. There.
end

-- Credit to Soviet Kitsune#3870 on Discord for this snippet
local config = require 'lspconfig'

local default = {
  on_attach = on_attach
}

local configs = {
  clangd = { on_attach = on_attach, root_dir = function() return vim.loop.cwd() end},
  pyls = default,
  gopls = default,
  rust_analyzer = default,
  rls = default,
}

for server, config in pairs(configs) do
   config[server].setup(config)
end
