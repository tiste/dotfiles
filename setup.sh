#!/bin/bash

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\e[0;35m $1\e[0m\n"
}

create_link() {
    local -r SRC=$1
    local -r DEST=$2

    mkdir -p "$(dirname "$DEST")"
    if ! [ -L "$DEST" ]; then
        ln -isv "$SRC" "$DEST"
    else
        print_info "Skipping, link already exists: $DEST"
    fi
}

declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -not -name .editorconfig -not -name .gitignore -not -name "*.sh" | sed -e "s|./||")

for file in $FILES_TO_SYMLINK; do
    create_link "$PWD/$file" "$HOME/.$file"
done

echo ""
read -p "Brew? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./brew.sh
fi
