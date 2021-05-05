set -gx XAUTHORITY $XDG_RUNTIME_DIR/Xauthority

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

source $XDG_CONFIG_HOME/fish/functions/*
