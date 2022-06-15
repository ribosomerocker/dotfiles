local map = vim.api.nvim_set_keymap

-- Bufferline maps
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', 'ml',           ':bn<CR>',                                                   { noremap = true, 
                                                                                        silent = true  })
map('n', 'mh',           ':bp<CR>',                                                   { noremap = true, 
                                                                                        silent = true  })
map('n', 'Ml',           ':BufferLineMoveNext<CR>',                                   { noremap = true,
                                                                                        silent = true  })
map('n', 'Mh',           ':BufferLineMovePrev<CR>',                                   { noremap = true,
                                                                                        silent = true  })
map('n', 'md',           ':Bdelete!<CR>',                                             { noremap = true,
                                                                                        silent = true  })

map('t', '<esc>',        '<C-\\><C-n>',                                               { noremap = true })
map('t', '<C-c><C-c>',   '<C-\\><C-n>',                                               { noremap = true })
map('n', '<leader>u',    ':UndoTreeShow<CR>',                                         { noremap = true,
                                                                                        silent = true  })
map('n', '<leader><CR>', ':luafile ~/.config/nvim/init.lua<CR>',                      { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>+',    ':vertical resize +5<CR>',                                   { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>-',    ':vertical resize -5<CR>',                                   { noremap = true,
                                                                                        silent = true  })
map('v', 'J',            ':m \'>+1<CR>gv=gv',                                         { noremap = true,
                                                                                        silent = true  })
map('v', 'K',            ':m \'<-2<CR>gv=gv',                                         { noremap = true,
                                                                                        silent = true  })
map('v', '<leader>p',    '"_dP',                                                      { noremap = true })
map('n', '<leader>y',    '"+y',                                                       { noremap = true })
map('v', '<leader>y',    '"+y',                                                       { noremap = true })
map('n', '<leader>Y',    'gg"+yG',                                                    { noremap = true })
map('n', '<leader>d',    '"_d',                                                       { noremap = true })
map('v', '<leader>d',    '"_d',                                                       { noremap = true })
map('i', '<C-c>',        '<esc>',                                                     { noremap = true })
map('n', '<leader>ghw',  ':h <C-R>=expand("<cword>")<CR><CR>',                        { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>bs',   '/<C-R>=escape(expand("<cword>"), "/")<CR><CR>',             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>w',    '<C-w>',                                                     { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>h',    ':wincmd h<CR>',                                             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>j',    ':wincmd j<CR>',                                             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>k',    ':wincmd k<CR>',                                             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>l',    ':wincmd l<CR>',                                             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>n',    ':NvimTreeToggle<CR>',                                       { noremap = true,
                                                                                        silent = true  })

-- LSP maps 
map('n', '<leader>vd',   ':lua vim.lsp.buf.definition()<CR>',                         { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vi',   ':lua vim.lsp.buf.implementation()<CR>',                     { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vsh',  ':lua vim.lsp.buf.signature_help()<CR>',                     { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vrr',  ':lua vim.lsp.buf.references()<CR>',                         { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vrn',  ':lua vim.lsp.buf.rename()<CR>',                             { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vh',   ':lua vim.lsp.buf.hover()<CR>',                              { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vca',  ':lua vim.lsp.buf.code_action()<CR>',                        { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vn',   ':lua vim.diagnostic.goto_next()<CR>',                       { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vf',   ':lua vim.diagnostic.setloclist()<CR>',                      { noremap = true,
                                                                                        silent = true  })
map('n', '<leader>vsd',  ':lua vim.diagnostic.open_float()<CR>',                      { noremap = true,
                                                                                        silent = true  })

function search_dotfiles()
    require("telescope.builtin").find_files({
            prompt_title = "< vimrc >",
            cwd = "~/.config/nvim",
            hidden = true
        })
end

-- Telescope maps 
map('n', '<leader>fg',   '<cmd>Telesope live_grep<CR>',                               { noremap = true })
map('n', '<leader>fb',   '<cmd>Telescope buffers<CR>',                                { noremap = true })
map('n', '<leader>fu',   '<cmd>Telescope oldfiles<CR>',                               { noremap = true })
map('n', '<leader>ca',   '<cmd>Telescope lsp_code_actions<CR>',                       { noremap = true })
map('n', '<leader>ft',   '<cmd>Telescope filetypes<CR>',                              { noremap = true })
map('n', '<leader>ff',   '<cmd>Telescope current_buffer_fuzzy_find<CR>',              { noremap = true })
map('n', '<leader>gf',   '<cmd>Telescope git_files<CR>',                              { noremap = true })
map('n', '<leader>df',   ':lua search_dotfiles()<CR>',                                { noremap = true, 
                                                                                        silent  = true })
map('n', '<leader>fm',   '<cmd>Telescope file_browser<CR>',                           { noremap = true })

-- Command mode maps
map('c', '<CR>',         [[wildmenumode() ? "\<C-Y>" : "\<CR>"]],                     { noremap = true, 
                                                                                        expr    = true })

-- Idris maps
map('n', '<leader>iac', ':lua require("idris2.code_action").add_clause()<CR>',        { noremap = true })
map('n', '<leader>igd', ':lua require("idris2.code_action").generate_def()<CR>',      { noremap = true })
map('n', '<leader>ics', ':lua require("idris2.code_action").case_split()<CR>',        { noremap = true })
map('n', '<leader>imc', ':lua require("idris2.code_action").make_case()<CR>',         { noremap = true })
map('n', '<leader>iml', ':lua require("idris2.code_action").make_lemma()<CR>',        { noremap = true })
map('n', '<leader>irh', ':lua require("idris2.code_action").refine_hole()<CR>',       { noremap = true })
map('n', '<leader>iim', ':lua require("idris2.code_action").intro()<CR>',             { noremap = true })
map('n', '<leader>ixs', ':lua require("idris2.code_action").expr_search()<CR>',       { noremap = true })
map('n', '<leader>ixh', ':lua require("idris2.code_action").expr_search_hints()<CR>', { noremap = true })
map('n', '<leader>imw', ':lua require("idris2.code_action").make_with()<CR>',         { noremap = true })
map('n', '<leader>ie',  ':lua require("idris2.repl").evaluate()<CR>',                 { noremap = true })
map('n', '<leader>ib',  ':lua require("idris2.browse").browse()<CR>',                 { noremap = true })
map('n', '<leader>iah',  ':lua require("idris2.metavars").request_all()<CR>',         { noremap = true })
map('n', '<leader>inh',  ':lua require("idris2.metavars").goto_next()<CR>',           { noremap = true })
map('n', '<leader>iph',  ':lua require("idris2.metavars").goto_prev()<CR>',           { noremap = true })
