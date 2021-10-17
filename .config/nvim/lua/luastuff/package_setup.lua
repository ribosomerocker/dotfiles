local cmd = vim.cmd

require 'paq-nvim' {
    'savq/paq-nvim';

    -- null lsp for setting up linters as language servers
    'jose-elias-alvarez/null-ls.nvim';

    'neovim/nvim-lspconfig';

    -- lsp completion
    'hrsh7th/nvim-cmp';

     -- cmp dependencies
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-nvim-lua';
    'hrsh7th/cmp-buffer';
    'saadparwaiz1/cmp_luasnip';
    -- lspkind for cmp completion info for cmp
    'onsails/lspkind-nvim';

    -- -- lsp completion v2 
    -- -- fast af completion, ig?
    -- { 'ms-jpg/coq_nvim', branch = 'coq' };
    -- -- snippets
    -- { 'ms-jpg/coq.artifacts', branch = 'artifacts' };
    -- -- nvim lua and other sources e.g. math
    -- { 'ms-jpg/coq.thirdparty', branch = '3p' };

    -- nvim-autopairs for automatic pair handling
    'windwp/nvim-autopairs';
    'L3MON4D3/LuaSnip';

   -- nice lookin' QOL stuff
   'akinsho/bufferline.nvim';
   'lukas-reineke/indent-blankline.nvim';
   -- 'famiu/feline.nvim';
   'windwp/windline.nvim';
   'MonAaraj/nvim-tree.lua';

   -- tree sitter
   {'nvim-treesitter/nvim-treesitter', run = function() cmd[["TSUpdate"]] end};

   'mbbill/undotree';

    -- git stuff
    'tpope/vim-fugitive';
    'junegunn/gv.vim';

    -- telescope dependencies
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    'nvim-telescope/telescope-fzf-native.nvim';
    'kyazdani42/nvim-web-devicons';

    -- colors
    'sheerun/vim-polyglot';
    {'challenger-deep-theme/vim', as = 'challenger-deep'};
}
