#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function installFiles() {
  rsync -avh --no-perms home/ ~;
  source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installFiles;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    installFiles;
  fi;
fi;
unset installFiles;
