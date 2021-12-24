# tonyc's refreshed (n)vim config

## Installing

Clone this repo from `~/.config`:

    git clone git@github.com:tonyc/nvim.git

Don't bother messing around with symlinks from legacy vim setups.

Start nvim and run `:PlugInstall`

## Requirements

fzf, ripgrep

    set -U FZF_DEFAULT_OPTS "--ansi --layout=reverse"
    set -U RIPGREP_CONFIG_PATH "~/.config/rg/rg.conf"

Contents of rg.conf:

    --ignore-file=.gitignore
    --fixed-strings

### For coc.nvim:

* nodejs

        asdf global nodejs 14.15.2

* coc-rust-analyzer

        :CocInstall coc-rust-analyzer
