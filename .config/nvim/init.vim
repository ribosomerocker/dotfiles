call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'

" lsp completion
Plug 'hrsh7th/nvim-cmp'

" cmp dependencies
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'

" lspkind for cmp completion info
Plug 'onsails/lspkind-nvim'

" nvim-autopairs for automatic pair handling
Plug 'windwp/nvim-autopairs'

" luasnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" nice lookin' QOL stuff
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'famiu/feline.nvim', { 'branch': 'develop' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'andweeb/presence.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mbbill/undotree'

" -------------------------------------------------

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Colors
Plug 'sheerun/vim-polyglot'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()

" General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

let g:nvim_tree_width = 20
let g:nvim_tree_highlight_opened_files = 3

set guifont=Victor\ Mono,FontAwesome:h20

lua <<EOF
require("luastuff.lsp")
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
require("luastuff.statusline")
EOF

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:lightline = {
"                   \ 'colorscheme': 'dracula',
"                   \ 'active': {
"                   \   'left': [ [ 'mode', 'paste' ],
"                   \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"                   \ },
"                   \ 'component_function': {
"                   \   'gitbranch': 'FugitiveHead'
"                   \ },
"                   \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"                   \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"                   \ }

" Bufferline, feline and indent-blackline setup here
lua <<EOF
require('bufferline').setup {
  options = {
    max_name_length = 16,
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    show_close_icon = true,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 20,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true ,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    seperator_style = "thin",
    },
    fill = {
         guifg = "#767676",
         guibg = "#212121",
     },
    close_button_selected = {
         guifg = "#ff8080",
         guibg = "#212121",
      },
    tab_close = {
         guifg = "#ff8080",
         guibg = "#212121",
      },
}

require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF

" Bufferline maps
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>ml :BufferLineCycleNext<CR>
nnoremap <silent>mh :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>Ml :BufferLineMoveNext<CR>
nnoremap <silent>Mh :BufferLineMovePrev<CR>
nnoremap <silent>md :bdelete!<CR>

" These commands will sort buffers by directory and language
nnoremap <silent>mx :BufferLineSortByExtension<CR>
nnoremap <silent>mi :BufferLineSortByDirectory<CR>

tnoremap <esc> <C-\><C-n>
tnoremap <C-c><C-c> <C-\><C-n>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" fun
com! W w
com! Wq wq
com! WQ wq

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup SET_STUFF_UP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

au BufReadPost *.asm set syntax=nasm

nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>w <C-w>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>f :NvimTreeToggle<CR>
