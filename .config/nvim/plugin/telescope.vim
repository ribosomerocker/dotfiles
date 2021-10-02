let g:telescope_cache_results = 1
let g:telescope_prime_fuzzy_find  = 1


nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fu <cmd>Telescope oldfiles<CR>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<CR>
nnoremap <leader>ft <cmd>Telescope filetypes<CR>
nnoremap <leader>ff <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>gf <cmd>Telescope git_files<CR>
