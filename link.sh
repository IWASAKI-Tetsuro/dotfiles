#! /usr/bin//bash

set -euo pipefail

cd "$(dirname "$0")"
LIST=$(find ./ -maxdepth 1 -type f -name ".*")

echo "${LIST}" | while read line; do
  if [ ! -f ~/${line} ]; then
    echo "Linking ${line} to HOME." 
    ln -s ~/dotfiles/${line} ~/
  fi
done
