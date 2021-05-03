HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob promptsubst GLOB_DOTS

autoload -Uz compinit
compinit

# Include hidden files
zmodload zsh/complist
# Menu selections
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
PROMPT=$'[%F{yellow}%n@%F{magenta}%M %F{green}$(prompt_clean_pwd) %f]%F{cyan}%#%f '


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH=$PATH:$HOME/.local/bin
export XDG_CACHE_HOME=/home/mon/.local/cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=/home/mon/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=/home/mon/.local/share

export XCOMPOSECACHE=$XDG_CACHE_HOME/X11/xcompose
export XCOMPOSEFILE=$XDG_CONFIG_HOME/X11/xcompose
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export CARGO_HOME=$XDG_DATA_HOME/cargo

export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0
export LESSHISTFILE=$XDG_CACHE_HOME/less/history
export LESSKEY=$XDG_CONFIG_HOME/less/lesskey
export NLTK_DATA=$XDG_DATA_HOME/nltk_data
export RUSTUP_HOME=$XDG_DATA_HOME/rustup/
export SXHKD_SHELL=/usr/bin/bash
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

export PF_INFO="ascii title host os de wm shell editor pkgs palette"
export PF_COL2=3

if [ -s "${XDG_CONFIG_HOME}/ssh/config" ]
then
    SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
fi
if [ -s "${XDG_DATA_HOME}/ssh/id_ed25519" ]
then
    SSH_ID="-i ${XDG_DATA_HOME}/ssh/id_ed25519"
fi

alias ssh="ssh $SSH_CONFIG $SSH_ID "
alias ssh-copy-id="ssh-copy-id $SSH_ID"
alias nv=nvim
alias py=python3.9
alias mkdir="mkdir -p"
alias cat="bat"
alias imgcopy="xclip -sel clipboard -t image/png -i" # a paste version of this, especially on terminal, would just be useless tbh
alias copy="xclip -sel clipboard -i"
alias paste="xclip -sel clipboard -o"
alias gpg2="gpg2 --homedir \"$XDG_DATA_HOME/gnupg\""
alias grep="rg"
alias startx="startx $XINITRC -- vt1"
alias wget="wget --continue --hsts-file=$HOME/.cache/wget-hsts"
alias weechat="weechat -d $XDG_CONFIG_HOME/weechat"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
alias irssi="irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi"
alias ls="exa --color=auto --icons"
alias dotdrop="/home/mon/Things/dotfiles/dotdrop.sh --cfg=/home/mon/Things/dotfiles/config.yaml"

pfetch
