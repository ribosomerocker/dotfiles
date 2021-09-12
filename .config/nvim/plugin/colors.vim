set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme challenger_deep
highlight ColorColumn ctermbg=0 guibg=#15121e
highlight SignColumn ctermbg=darkgrey guibg=#100E23
highlight EndOfBuffer ctermfg=grey guifg=#353b52
