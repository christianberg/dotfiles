# Dotfiles

These are my personal configuration files and scripts.

The files are managed with GNU Stow. This repository should be checked
out into the directory `dotfiles` in the home directory. Files are
grouped by topic into subdirectories. To activate a group of settings,
change into the `dotfiles` dir and run `stow <subdir>`.

The script `stow-dotfiles` does this for all subdirectories. (This
script is put on your PATH if activate both the `bin` and `bash`
setting groups.)