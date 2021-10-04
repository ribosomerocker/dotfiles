local cmd = vim.cmd

require 'paq-nvim' {
    'savq/paq-nvim';

    -- lsp completion
    'neovim/nvim-lspconfig';
    'hrsh7th/nvim-cmp';

     -- cmp dependencies
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-nvim-lua';
    'hrsh7th/cmp-buffer';

    -- lspkind for cmp completion info
    'onsails/lspkind-nvim';

    -- nvim-autopairs for automatic pair handling
    'windwp/nvim-autopairs';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';

   -- nice lookin' QOL stuff
   'akinsho/bufferline.nvim';
   'lukas-reineke/indent-blankline.nvim';
   'famiu/feline.nvim';
   'kyazdani42/nvim-tree.lua';

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
