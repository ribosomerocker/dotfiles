# Dotfiles

This repository is just a collection of dotfiles I deem are important either for me to restore or for people to take a gander at.
This repository uses stow as a dotfiles manager.
Got suggestions? [Make an issue](https://github.com/MonAaraj/dotfiles/issues).
For anything else, you can email me at mon.aaraj815\<at\>gmail.com

You can do whatever you want from what you find here, it's public without a license for a reason.
Don't use it for bad stuff though.

# How does it work?

Preferrably go into a directory that's into home, e.g. ~/Git, run `git clone https://github.com/MonAaraj/dotfiles`, then run `stow dotfiles`, and it will set it up all in your home exactly how it's supposed to be. Well, I've only used it after deleting/moving the original `~/.config` and `~/.local/bin` to some other location, and it worked exactly how I wanted to after doing such.

## What if I want to put it somewhere else?

That's easy! Just clone this repository somewhere, then run this command: `stow -d path/to/parent/dir/of/repo -t $HOME dotfiles`

Which will run stow, telling it to set the directory to the parent of the git repo you cloned and the target to your home directory, it'll basically just detect all the folders and files inside the repo. read the `.stow-local-ignore` file to determine which files it needs to ignore (which I set to ignore the README and `.git` files/folder) and then symlink any directory inside your git repository into your home directory, with the same name and path

Thus, you'll have this setup:

```
~/Git/dotfiles/.config    -> ~/.config
~/Git/dotfiles/.local/bin -> ~/.local/bin
```

And voila, everything should be set up properly.

# What I use

Shell: ZSH

WM: BSPWM + SXHKD

Terminal Emulator: Alacritty

Editor: Neovim

Launcher: Rofi

Terminal Multiplexer: TMUX

Compositor: Picom
