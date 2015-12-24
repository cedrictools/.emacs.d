#!/usr/bin/env sh

if [[ -d "$HOME/.emacs.d" ]]; then
  echo "Backing up previous emacs installation before cloning to: .emacs.d.bak"
  mv "$HOME/.emacs.d{,.bak}"
fi

git clone git@github.com:instilled/.emacs.d.git "$HOME/.emacs.d"
(cd "$HOME/.emacs.d" && git submodule update --init --recursive)
