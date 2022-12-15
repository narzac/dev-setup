#!/bin/bash

# Make bash default shell
chsh -s /bin/bash

# TODO: Here install the homebrew by first checking if it is already installed
bash ./install-homebrew.sh

# adjust paths for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install python
brew install ansible

ansible-playbook --ask-vault-pass osx-playbook.yml ## --ask-become-pass