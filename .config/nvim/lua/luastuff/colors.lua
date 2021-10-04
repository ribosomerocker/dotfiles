local cmd = vim.cmd

-- table of colors; useful for satusline
local _M = {
    baby_pink     = "#DE8C92",
    black         = "#1e222a",
    black2        = "#252931",
    blue          = "#61afef",
    cyan          = "#a3b8ef",
    dark_purple   = "#c882e7",
    darker_black  = "#1b1f27",
    folder_bg     = "#61afef",
    green         = "#A3BE8C",
    grey          = "#42464e",
    grey_fg       = "#565c64",
    grey_fg2      = "#6f737b",
    light_grey    = "#6f737b",
    lightbg       = "#2d3139",
    lightbg2      = "#262a32",
    line          = "#2a2e36",
    nord_blue     = "#81A1C1",
    one_bg        = "#282c34",
    one_bg2       = "#353b45",
    one_bg3       = "#30343c",
    orange        = "#fca2aa",
    pink          = "#ff75a0",
    pmenu_bg      = "#A3BE8C",
    purple        = "#b4bbc8",
    red           = "#d47d85",
    statusline_bg = "#22262e",
    sun           = "#EBCB8B",
    teal          = "#519ABA",
    vibrant_green = "#7eca9c",
    white         = "#abb2bf",
    yellow        = "#e7c787"
}

-- do some color-related stuff
cmd[[colorscheme           challenger_deep]]
cmd[[highlight EndOfBuffer ctermfg=grey guifg=#353b52]]
cmd[[highlight Linenr      guibg=000000]]

return _M
