# Dotfiles

## Getting Started:

```sh
cd ~
git clone https://github.com/joaomarcuslf/dotfiles/

cd dotfiles

sudo chmod +x start.sh
./start.sh
```

## To manually install:
- [FiraCode](https://github.com/tonsky/FiraCode/wiki/Installing)
- [git-extras](https://github.com/tj/git-extras/blob/master/Installation.md)
- [Hyper](https://hyper.is/)

## Recommended:
- [pip](https://pip.pypa.io/en/stable/installing/)
- [tig](https://jonas.github.io/tig/INSTALL.html)
- [Kite](https://www.kite.com/install/?utm_medium=editor&utm_source=vscode)
- [Insomnia](https://insomnia.rest/download)
- [RStudio](https://rstudio.com/products/rstudio/download/)
- [R](https://cran.r-project.org/)
- [Anaconda](https://docs.anaconda.com/anaconda/install/)

<!-- Commenting this out, giving Hyper a chance
## Mac only:

- iterm2
- [One Dark](https://github.com/one-dark/iterm-one-dark-theme)
- [brew](https://brew.sh/index_pt-br.html)

## Linux only:

- terminator
- [One Dark](https://github.com/EliverLara/terminator-themes) -->

## How to use this repo:

This is my dotfiles, it comes with a bunch of scripts, and configs to improve my productive. If you want to use, you must follow the [Getting started](#getting-started), and then [manually install](#to-manually-install) some packages that are useful.

If you need to add custom variables, create this files `~/.bash_locals`, this will be imported in the `.bashrc` keeping your exports safe.

Also, after you run `start.sh`, your old configs will be saved in files with the sufix `.pre-dotfiles`.
