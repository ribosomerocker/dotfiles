local cmd = vim.cmd
local set_hl = vim.api.nvim_set_hl

-- table of colors; useful for satusline
-- local _M = {
--     baby_pink     = "#DE8C92",
--     black         = "#1e222a",
--     black2        = "#252931",
--     blue          = "#61afef",
--     cyan          = "#a3b8ef",
--     dark_purple   = "#c882e7",
--     darker_black  = "#1b1f27",
--     folder_bg     = "#61afef",
--     green         = "#A3BE8C",
--     grey          = "#42464e",
--     grey_fg       = "#565c64",
--     grey_fg2      = "#6f737b",
--     light_grey    = "#6f737b",
--     lightbg       = "#2d3139",
--     lightbg2      = "#262a32",
--     line          = "#2a2e36",
--     nord_blue     = "#81A1C1",
--     one_bg        = "#282c34",
--     one_bg2       = "#353b45",
--     one_bg3       = "#30343c",
--     orange        = "#fca2aa",
--     pink          = "#ff75a0",
--     pmenu_bg      = "#A3BE8C",
--     purple        = "#b4bbc8",
--     red           = "#d47d85",
--     statusline_bg = "#22262e",
--     sun           = "#EBCB8B",
--     teal          = "#519ABA",
--     vibrant_green = "#7eca9c",
--     white         = "#abb2bf",
--     yellow        = "#e7c787"
-- }

-- do some color-related stuff
-- TODO: use lua for this via the 0.7 api
cmd[[colorscheme            challenger_deep]]
cmd[[highlight EndOfBuffer  ctermfg=grey guifg=#353b52]]
cmd[[highlight Linenr       guibg=000000]]
cmd[[highlight StatusLine   guibg=#110142]]
cmd[[highlight StatusLineNc guibg=#110142]]


-- Idris highlighting
cmd [[highlight link LspSemantic_type       Include   ]] -- Use the same highlight as the Include group
cmd [[highlight link LspSemantic_function   Identifier]] -- Functions names
cmd [[highlight link LspSemantic_enumMember Number    ]]   -- Data constructors
cmd [[highlight      LspSemantic_variable   guifg=gray]] -- Bound variables
cmd [[highlight link LspSemantic_keyword    Structure ]]  -- Keywords
cmd [[highlight link LspSemantic_namespace  Identifier]] -- Explicit namespaces
cmd [[highlight link LspSemantic_postulate  Define    ]] -- Postulates
cmd [[highlight link LspSemantic_module     Identifier]] -- Module identifiers


-- return _M
