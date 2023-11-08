#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

# dotfilesディレクトリの中身のリンクをホームディレクトリ直下に作成
cd ${dotfiles_root}
for file in .??*; do  # ".??*" は"."や".."を省くために使います
    [ "$file" = ".git" ] && continue  # .gitは無視します
    ln -s ${PWD}/${file} ${HOME}
done
