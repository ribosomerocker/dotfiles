HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob promptsubst GLOB_DOTS interactivecomments

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

if [ -s "${XDG_CONFIG_HOME}/ssh/config" ]
then
    SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
fi
if [ -s "${XDG_DATA_HOME}/ssh/id_ed25519" ]
then
    SSH_ID="-i ${XDG_DATA_HOME}/ssh/id_ed25519"
fi

eval "$(fasd --init auto)"

alias ssh="ssh $SSH_CONFIG $SSH_ID"
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
alias ls="exa --icons -h"
alias la="exa --icons -ah"
alias ll="exa --icons -alh"
alias config='/usr/bin/git -C $HOME/Git/dotfiles/'
alias stowdf='stow -vd $HOME/Git dotfiles'
alias scheme="scheme --eehistory $XDG_CACHE_HOME/chez"
alias petite="petite --eehistory $XDG_CACHE_HOME/chez"
alias cat="bat"
alias e='f -e $EDITOR'
alias ea='f -e editas'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete
