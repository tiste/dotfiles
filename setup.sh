#!/bin/bash

set -euo pipefail

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] %s\e[0m\n" "$1"
}

print_info() {
    # Print output in purple
    printf "\e[0;35m %s\e[0m\n" "$1"
}

create_link() {
    local -r SRC=$1
    local -r DEST=$2

    mkdir -p "$(dirname "$DEST")"
    if ! [ -L "$DEST" ]; then
        ln -isv "$SRC" "$DEST"
    else
        print_info "Skipping, symlink already exists: $DEST"
    fi
}

declare -a FILES_TO_SYMLINK
FILES_TO_SYMLINK=($(find . -type f -maxdepth 1 -not -name .editorconfig -not -name .gitignore -not -name README.md -not -name "*.sh" | sed -e "s|./||"))

for file in "${FILES_TO_SYMLINK[@]}"; do
    create_link "$PWD/$file" "$HOME/.$file"
done

echo ""
read -rp "Update OSX defaults? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./osx.sh
fi
