HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob promptsubst GLOB_DOTS

autoload -Uz compinit
compinit

# Include hidden files
zmodload zsh/complist
# Menu selections
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu yes select
bindkey -M menuselect '?' history-incremental-search-forward

# Enable case-insensitive completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

compinit
_comp_options+=(globdots)

bindkey -v

prompt_clean_pwd() {
    local num tmp p q
    if [[ -v prompt_clean_pwd_length ]]; then
        num=$prompt_clean_pwd_length
    else
        num=1
    fi

    p="${PWD#$HOME}"
    if [[ $PWD != $p ]]; then
        printf '~'
    fi

    local -a dirlist
    dirlist=(${(ps:/:)p})
    if [[ $num -ne 0 && ${#dirlist[@]} -gt $num ]]; then
        for q in ${dirlist:0:(-$num)}; do
            printf "/${q:0:2}"
        done
        for q in ${dirlist:(-$num)}; do
            printf "/$q"
        done
    else
        printf "$p"
    fi
}
PROMPT=$'%F{green}$(prompt_clean_pwd)%F{white}:%F{yellow}%n%F{cyan}%#%f '

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export XDG_CACHE_HOME=$HOME/.local/cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/lib/go/bin:$XDG_DATA_HOME/opam/4.12.0/bin"

export XCOMPOSECACHE=$XDG_CACHE_HOME/X11/xcompose
export XCOMPOSEFILE=$XDG_CONFIG_HOME/X11/xcompose
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XCURSOR_SIZE=32

export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go

export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0
export LESSHISTFILE=$XDG_CACHE_HOME/less/history
export LESSKEY=$XDG_CONFIG_HOME/less/lesskey
export NLTK_DATA=$XDG_DATA_HOME/nltk_data
export RUSTUP_HOME=$XDG_DATA_HOME/rustup/
export SXHKD_SHELL=/usr/bin/bash
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export LS_COLORS="$(vivid generate molokai)"
export GFORTHHIST="$XDG_DATA_HOME"

export PF_INFO="ascii title host os de wm shell editor pkgs palette"
export PF_COL2=2
export PF_COL3=5
export PF_COL1=3

export XKB_DEFAULT_MODEL=pc105
export XKB_DEFAULT_LAYOUT=us,us,ar
export XKB_DEFAULT_VARIANT=,colemak_dh,
export XKB_DEFAULT_OPTIONS=grp:win_space_toggle,compose:sclk,shift:both_capslock,altwin:menu_win
export _FASD_DATA="$XDG_DATA_HOME/fasd"
export OPAMROOT="$XDG_DATA_HOME/opam"
export CAML_LD_LIBRARY_PATH="$XDG_DATA_HOME/opam/4.12.0/lib/stublibs:/usr/lib/ocaml/stublibs:/usr/lib/ocaml"
export OCAML_TOPLEVEL_PATH="$XDG_DATA_HOME/opam/4.12.0/lib/toplevel"
export MANPATH=":$XDG_DATA_HOME/opam/4.12.0/man:/home/mon/.opam/4.12.0/man"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"

if [ -s "${XDG_CONFIG_HOME}/ssh/config" ]
then
    SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
fi
if [ -s "${XDG_DATA_HOME}/ssh/id_ed25519" ]
then
    SSH_ID="-i ${XDG_DATA_HOME}/ssh/id_ed25519"
fi

eval "$(ssh-agent)" 1>/dev/null

eval "$(fasd --init auto)"

alias ssh="ssh $SSH_CONFIG $SSH_ID "
alias ssh-copy-id="ssh-copy-id $SSH_ID"
alias nv=nvim
alias py=python3.9
alias mkdir="mkdir -p"
alias imgcopy="xclip -sel clipboard -t image/png -i" # a paste version of this, especially on terminal, would just be useless tbh
alias copy="xclip -sel clipboard -i"
alias paste="xclip -sel clipboard -o"
alias grep="rg"
alias startx="startx $XINITRC -- vt1"
alias weechat="weechat -d $XDG_CONFIG_HOME/weechat"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
alias irssi="irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi"
alias ls="exa --icons"
alias la="exa --icons -a"
alias ll="exa --icons -al"
alias config='/usr/bin/git -C $HOME/Git/dotfiles/'
alias todo.sh='todo.sh -d $HOME/.config/todo/config'
alias stowdotfiles='stow -vd $HOME/Git dotfiles'
alias scheme="scheme --eehistory $XDG_CACHE_HOME/chez"
alias petite="petite --eehistory $XDG_CACHE_HOME/chez"
alias cat="bat"
alias e='f -e nvim'
alias ea='f -e editas'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete

pfetch
