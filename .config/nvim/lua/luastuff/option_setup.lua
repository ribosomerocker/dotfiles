local opt = vim.opt

opt.guifont              =  "VictorMono Nerd Font Mono:h20, FontAwesome:h20"
opt.hlsearch             =  false
opt.hidden               =  true
opt.errorbells           =  false
opt.tabstop              =  4
opt.softtabstop          =  4
opt.shiftwidth           =  4
opt.expandtab            =  true
opt.smartindent          =  true
opt.nu                   =  true
opt.smartcase            =  true
opt.swapfile             =  false
opt.backup               =  false 
opt.undodir              =  "/home/mon/.local/share/nvim/undodir"
opt.undofile             =  true
opt.incsearch            =  true
opt.scrolloff            =  8
opt.showmode             =  false
opt.showmatch            =  true
opt.clipboard:append     "unnamedplus"
opt.signcolumn           =  "yes"
opt.termguicolors        =  true
opt.completeopt          = {"menuone", "noselect"}


-- message height
opt.cmdheight            =  1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime           =  50

--  Don't pass messages to |ins-completion-menu|.
opt.shortmess:append     "c"
opt.colorcolumn          =  "120"
opt.path:append          "**"
opt.wildmode             =  {"longest", "list", "full"}
opt.wildmenu             =  true

opt.wildignore:append {  
    "*.pyc",
    "*_build/*",
    "**/coverage/*",
    "**/node_modules/*",
    "**/android/*",
    "**/ios/*",
    "**/.git/*",
}

opt.fillchars           =  "eob:|"
