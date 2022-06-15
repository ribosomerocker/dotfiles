require 'paq' {
    'savq/paq-nvim';

    -- null lsp for setting up linters as language servers
    'jose-elias-alvarez/null-ls.nvim';

    'neovim/nvim-lspconfig';

    -- lsp completion
    'hrsh7th/nvim-cmp';

    -- cmp dependencies
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-nvim-lua';
    'ray-x/cmp-treesitter';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-nvim-lsp-signature-help';
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
    -- mayhaps?
    -- 'rafamadriz/friendly-snippets';

    -- nice lookin' QOL stuff
    'akinsho/bufferline.nvim';
    'lukas-reineke/indent-blankline.nvim';
    -- im a minimalist now, i guess? 
    -- 'famiu/feline.nvim';
    'kyazdani42/nvim-tree.lua';

    -- tree sitter
    {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd[["TSUpdate"]] end};
    {'eraserhd/parinfer-rust', run = 'cargo build --release'};
    'wlangstroth/vim-racket';
    'p00f/nvim-ts-rainbow';

    'mbbill/undotree';

    -- telescope dependencies
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    'nvim-telescope/telescope-fzf-native.nvim';
    'kyazdani42/nvim-web-devicons';

    -- colors
    'sheerun/vim-polyglot';
    {'challenger-deep-theme/vim', as = 'challenger-deep'};
    'chriskempson/base16-vim';
    'famiu/bufdelete.nvim';
    'tpope/vim-dispatch';
    'machakann/vim-sandwich';
    'Konfekt/vim-compilers';
    {'LhKipp/nvim-nu', run = function() vim.cmd[["TSInstall nu"]] end};
    'kmonad/kmonad-vim';
    'MunifTanjim/nui.nvim';
    --'edwinb/idris2-vim';
    'ShinKage/idris2-nvim';
}
