local fn = vim.fn
local g = vim.g
local opt = vim.opt
local api = vim.api
local create_augroup = api.nvim_create_augroup
local create_autocmd = api.nvim_create_autocmd
local add_ext = vim.filetype.add
local create_cmd = api.nvim_create_user_command

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

-- if paq path doesn't have any files - then install paq. setting up paq if it doesn't exist
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require 'pkgs'
require 'opts'
require 'colors'
require 'lsp'


require 'idris2'.setup({})
require 'nvim-treesitter.configs'.setup(
  { 
    highlight = { 
      enable = true 
    }, 
    rainbow = { 
      enable = true, 
      extended_mode = true, 
      max_file_lines = nil
    } 
  }
)

require 'nu'.setup({
    complete_cmd_names = true, -- requires https://github.com/jose-elias-alvarez/null-ls.nvim  
})

-- nvim autopair stuff 
local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}

-- file explorer tree 
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    width = 20,
    hide_root_folder = false, 
    side = 'left',
  }
}

-- Bufferline, feline and indent_blankline setup here
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
    enforce_regular_tabs = false,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true ,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    seperator_style = "thin",
  },
  highlights = {
    fill = {
      guifg = "#767676",
      guibg = "#212121",
    },
    close_button_selected = {
      guifg = "#ff8080",
      guibg = "#1e1c31",
    },
    tab_close = {
      guifg = "#ff8080",
      guibg = "#212121",
    },
    separator = {
      guifg = "#161524",
      guibg = "#161524",
    },
    separator_visible = {
      guifg = "#161524",
      guibg = "#161524",
    },
    separator_selected = {
      guifg = "#f800fc",
      guibg = "#f800fc",
    },
    diagnostic_selected = {
      gui = "bold"
    },
    buffer_selected = {
      gui = "bold"
    },
    error_selected = {
      gui = "bold"
    },
    warning_selected = {
      gui = "bold"
    }
  }
}

require 'indent_blankline'.setup {
  indentLine_enabled = 1,
  char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}

if fn.executable('rg') then
    g["rg_derive_root"] = 1
end

g["loaded_matchparen"] = 1
g["mapleader"] = " "

-- Load mappings
require 'maps'

function trim_whitespace()
    local save = fn.winsaveview()
    api.nvim_exec(string.format("silent! %s", v), false)
    fn.winrestview(save)
end

-- QoL commands
create_cmd('W',  'w',  {})
create_cmd('Wq', 'wq', {})
create_cmd('WQ', 'wq', {})
create_cmd('Q',  'q',  {})

-- highlights yanked area, i love this
create_autocmd("TextYankPost", {
    group = create_augroup("highlight_yank", { clear =  true }),
    pattern = "*",
    callback = function() require'vim.highlight'.on_yank({timeout = 30}) end,
})

-- trim whitespace
create_autocmd("BufWritePre", {
    group = create_augroup("trim_whitespace", { clear =  true }),
    pattern = "*",
    callback = trim_whitespace,
})
