local map = vim.api.nvim_set_keymap

-- Bufferline maps
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', 'ml',           ':BufferLineCycleNext<CR>',                       { silent = true, noremap = true })
map('n', 'mh',           ':BufferLineCyclePrev<CR>',                       { silent = true, noremap = true })

map('n', 'Ml',           ':BufferLineMoveNext<CR>',                        { silent = true, noremap = true })
map('n', 'Mh',           ':BufferLineMovePrev<CR>',                        { silent = true, noremap = true })
map('n', 'md',           ':bdelete!<CR>',                                  { silent = true, noremap = true })

map('t', '<esc>',        '<C-\\><C-n>',                                     { noremap = true })
map('t', '<C-c><C-c>',   '<C-\\><C-n>',                                     { noremap = true })
map('n', '<leader>u',    ':UndoTreeShow<CR>',                              { noremap = true })
map('n', '<leader><CR>', ':luafile ~/.config/nvim/init.lua<CR>',           { noremap = true })
map('n', '<leader>+',    ':vertical resize +5<CR>',                        { noremap = true })
map('n', '<leader>-',    ':vertical resize -5<CR>',                        { noremap = true })
map('v', 'J',            ':m \'>+1<CR>gv=gv',                              { noremap = true })
map('v', 'K',            ':m \'>-2<CR>gv=gv',                              { noremap = true })
map('v', '<leader>p',    '"_dP',                                           { noremap = true })
map('n', '<leader>y',    '"+y',                                            { noremap = true })
map('v', '<leader>y',    '"+y',                                            { noremap = true })
map('n', '<leader>Y',    'gg"+yG',                                         { noremap = true })
map('n', '<leader>d',    '"_d',                                            { noremap = true })
map('v', '<leader>d',    '"_d',                                            { noremap = true })
map('i', '<C-c>',        '<esc>',                                          { noremap = true })
map('n', '<leader>gc',   ':GBranches<CR>',                                 { noremap = true })
map('n', '<leader>ga',   ':Git fetch --all<CR>',                           { noremap = true })
map('n', '<leader>grum', ':Git rebaes upstream/master<CR>',                { noremap = true })
map('n', '<leader>grom', ':Git rebaes origin/master<CR>',                  { noremap = true })
map('n', '<leader>ghw',  ':h <C-R>=expand("<cword>")<CR><CR>',             { noremap = true })
map('n', '<leader>bs',   '/<C-R>=escape(expand("<cword>"), "/")<CR><CR>',  { noremap = true })
map('n', '<leader>w',    '<C-w>',                                          { noremap = true })
map('n', '<leader>h',    ':wincmd h<CR>',                                  { noremap = true })
map('n', '<leader>j',    ':wincmd j<CR>',                                  { noremap = true })
map('n', '<leader>k',    ':wincmd k<CR>',                                  { noremap = true })
map('n', '<leader>l',    ':wincmd l<CR>',                                  { noremap = true })
map('n', '<leader>f',    ':NvimTreeToggle<CR>',                            { noremap = true })

-- LSP maps 
map('n', '<leader>vd',   ':lua vim.lsp.buf.definition()<CR>',              { noremap = true })
map('n', '<leader>vi',   ':lua vim.lsp.buf.implementation()<CR>',          { noremap = true })
map('n', '<leader>vsh',  ':lua vim.lsp.buf.signature_help()<CR>',          { noremap = true })
map('n', '<leader>vrr',  ':lua vim.lsp.buf.references()<CR>',              { noremap = true })
map('n', '<leader>vrn',  ':lua vim.lsp.buf.rename()<CR>',                  { noremap = true })
map('n', '<leader>vh',   ':lua vim.lsp.buf.hover()<CR>',                   { noremap = true })
map('n', '<leader>vca',  ':lua vim.lsp.buf.code_action()<CR>',             { noremap = true })
map('n', '<leader>vn',   ':lua vim.lsp.diagnostic.goto_next()<CR>',        { noremap = true })

-- Telescope maps 
map('n', '<leader>fg',   '<cmd>Telesope live_grep<CR>',                    { noremap = true })
map('n', '<leader>fb',   '<cmd>Telescope buffers<CR>',                     { noremap = true })
map('n', '<leader>fu',   '<cmd>Telescope oldfiles<CR>',                    { noremap = true })
map('n', '<leader>ca',   '<cmd>Telescope lsp_code_actions<CR>',            { noremap = true })
map('n', '<leader>ft',   '<cmd>Telescope filetypes<CR>',                   { noremap = true })
map('n', '<leader>ff',   '<cmd>Telescope current_buffer_fuzzy_find<CR>',   { noremap = true })
map('n', '<leader>gf',   '<cmd>Telescope git_files<CR>',                   { noremap = true })
