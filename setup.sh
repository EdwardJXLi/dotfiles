#!/bin/bash

set -e

SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +"%Y-%m-%d-%s")"

if [ $1 != "nobackup" ]; then
    echo Original files will be saved in $BACKUP_DIR
    mkdir -p "$BACKUP_DIR"
fi

ls -A1 "$SRC_DIR/dotfiles" | while read i; do
    if [ $1 != "nobackup" ]; then
        ! mv "$HOME/$i" "$BACKUP_DIR" 2>/dev/null
    else
        ! rm -rf -- "$HOME/$i"
    fi

    ln -s "$SRC_DIR/dotfiles/$i" "$HOME/$i"
done
