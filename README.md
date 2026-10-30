# dotfiles

This repository is used to store my configuration files with a quick installation guide for my personal needs.

## How it works

The `install.sh` script symlinks each file of this repository into your home directory at the same relative path.

For example, `.ssh/config` is linked as `~/.ssh/config`, so any change to the configuration is tracked by this repository.

Existing files in your home directory are replaced by the symbolic links.

## Installation

1. Clone this repository:

    ```bash
    git clone git@github.com:pilottdev/dotfiles.git && cd dotfiles
    ```

2. Run installation script to create symbolic links in your home directory:

    ```bash
    ./install.sh
    ```

3. If necessary, you can cancel changes to force usage of the configuration of this repository:

    ```bash
    git restore .
    ```
