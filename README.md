# Dotfiles
This repository contains dotfiles that I use frequently on other computers,
e.g. vimrc and gitconfig, as well as a script for linking them conveniently.

## Linking
link.sh allows the user to keep dotfiles in a centralized folder by creating
symlinks to them in the home directory (where they are typically expected).
For any file/folder F in the script's directory that is not explicitly excluded
(see the 'find' command used to populate the $FILES variable), a symlink ~/.F
will be created.
