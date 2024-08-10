#!/bin/bash
set -e

# Update and upgrade packages
# sudo apt update && sudo apt upgrade -y

# Paths
DOTFILES_DIR="$HOME/.dotfiles_ansible"
SSH_DIR="$HOME/.ssh"

# Install Ansible
if ! [ -x "$(command -v ansible)" ]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible -y
fi

if [ -x "$(command -v ansible)" ]; then
    ansible-playbook -i $DOTFILES_DIR/inventory $DOTFILES_DIR/main.yml --ask-become-pass
else
    echo "Check, something's wrong. Didn't run ansible."
fi
