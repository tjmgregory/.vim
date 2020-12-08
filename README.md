# .vim/

My vim setup, making use of Vim 8's native package support and Git's submodules.

Branching can be used to switch between language support. Inspired by the wonderful [@mikesive](https://github.com/mikesive)'s [vim setup](https://github.com/mikesive/.vim).

## Setup

This requires Vim 8 or higher.

The following commands assume you're happy to lose any pre-existing configurations.

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

Add the following command to you bash rc, as it solves a [known issue](https://github.com/gitextensions/gitextensions/issues/3065) with branching and sub-modules.

This can be run with `vco branch-name` to switch between the branches for different languages.

```bash
export VIM_DIR=~/.vim/.git
function vco(){
   git --git-dir $VIM_DIR submodule deinit .
   git --git-dir $VIM_DIR checkout --force $1
   git --git-dir $VIM_DIR submodule update --init --recursive
}
```
