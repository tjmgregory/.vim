# .vim/

My vim setup, making use of Vim 8's native package support and Git's submodules.

Branching can be used to switch between language support. Inspired by the wonderful [@mikesive](https://github.com/mikesive)'s [vim setup](https://github.com/mikesive/.vim).

## Setup

This requires Vim 8 or higher.

The following commands assume you're happy to lose any pre-existing configurations.

It also assumes that you are using the [Homebrew](https://brew.sh) package manager, and the [Zsh](https://www.zsh.org/) shell.

```bash
git clone --recursive git@github.com:tjmgregory/.vim.git ~/.vim
chmod +x ~/.vim/install
~/.vim/install
```

### RipGrep

To make RG look more like SilverSearcher when running FZF, add the following to ~/.config/ripgrep/rc:

```bash
--colors=line:fg:yellow
--colors=line:style:bold
--colors=path:fg:green
--colors=path:style:bold
--colors=match:fg:black
--colors=match:bg:yellow
--colors=match:style:nobold
```

### Switching languages

The install script will add the function `vco` to your path. Each branch of this repo represents a different setup for vim.

i.e. `vco go` will setup vim for developing Go.
