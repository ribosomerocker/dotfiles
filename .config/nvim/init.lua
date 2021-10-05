local fn = vim.fn
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local api = vim.api

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

-- if paq path doesn't have any files - then install paq. setting up paq if it doesn't exist
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

-- paq plugins
require 'luastuff.package_setup'

-- load configs for lsp and statusline
require 'luastuff.option_setup'
require 'luastuff.colors'
require 'luastuff.lsp'
require 'luastuff.statusline'

require 'nvim-treesitter.configs'.setup { highlight = { enable = true } }

-- file explorer tree 
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        width = 20,
        side = 'left',
    }
}

-- Bufferline, feline and indent-blackline setup here
require 'bufferline'.setup {
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

require 'indent_blankline'.setup {
    show_end_of_line = true,
}

g["loaded_matchparen"] = 1
g["mapleader"] = " "


if fn.executable('rg') then
    g["rg_derive_root"] = 1
end


-- Load mappings
require 'luastuff.mapping_setup'

function trim_whitespace()
    local save = fn.winsaveview()
    api.nvim_exec(string.format("silent! %s", v), false)
    fn.winrestview(save)
end

-- QoL commands
cmd[[com! W w]]
cmd[[com! Wq wq]]
cmd[[com! WQ wq]]
cmd[[com! Q q]]

-- highlights yanked area, i love this
cmd [[augroup highlight_yank]]
cmd [[autocmd!]]
cmd [[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})]]
cmd [[augroup END]]

-- trim whitespace
cmd [[augroup SET_STUFF_UP]]
cmd [[    autocmd!]]
cmd [[    autocmd BufWritePre * :lua trim_whitespace()]]
cmd [[augroup END]]

-- for some reason syntax is weird when you open a .asm file, so i set syntax to nasm
cmd [[au BufReadPost *.asm set syntax=nasm]]