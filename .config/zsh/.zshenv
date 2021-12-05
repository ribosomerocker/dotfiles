export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export XDG_CACHE_HOME=$HOME/.local/cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$HOME/.local/bin:$HOME/.local/lib/go/bin:$PATH"

export XCOMPOSECACHE=$XDG_CACHE_HOME/X11/xcompose
export XCOMPOSEFILE=$XDG_CONFIG_HOME/X11/xcompose
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XCURSOR_SIZE=32

export TERMINAL=st
export BROWSER=firefox
export EDITOR=nvim
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export NLTK_DATA="$XDG_DATA_HOME"/nltk_data
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup/
export SXHKD_SHELL=/usr/bin/zsh
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export WINEPREFIX="$XDG_DATA_HOME"/wine
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
export RLWRAP_HOME="$XDG_DATA_HOME"/rlwrap
