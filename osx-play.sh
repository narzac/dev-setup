#!/bin/bash

# TODO: Here install the homebrew by first checking if it is already installed
# bash ./install-homebrew.sh

# brew install python
# brew install ansible

ansible-playbook --ask-vault-pass osx-playbook.yml ## --ask-become-pass