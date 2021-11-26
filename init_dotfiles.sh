#!/bin/bash

set -ue

CURRENT_USER_DIR=$(cd ~/; pwd)

echo 'git clone dotfiles'
CURRENT_USER_DIR=$(cd ~/; pwd)
DOTFILES_ROOT=${CURRENT_USER_DIR}/ghq/github.com/shimx/dotfiles

echo "mkdir -p ${CURRENT_USER_DIR}/ghq/github.com/shimx"
mkdir -p ${CURRENT_USER_DIR}/ghq/github.com/shimx

echo "git clone https://github.com/shimx/dotfiles ${DOTFILES_ROOT}"
git clone https://github.com/shimx/dotfiles ${DOTFILES_ROOT}

echo 'make dotfiles symlinks'
echo "ln -sf ${DOTFILES_ROOT} ${CURRENT_USER_DIR}/dotfiles"
ln -sf ${DOTFILES_ROOT} ${CURRENT_USER_DIR}/dotfiles

echo "ln -sf ${DOTFILES_ROOT}/config/tmux/tmux.conf ${CURRENT_USER_DIR}/.tmux.conf"
ln -sf ${DOTFILES_ROOT}/config/tmux/tmux.conf ${CURRENT_USER_DIR}/.tmux.conf

echo "ln -sf ${DOTFILES_ROOT}/config/zsh/zshenv ${CURRENT_USER_DIR}/.zshenv"
ln -sf ${DOTFILES_ROOT}/config/zsh/zshenv ${CURRENT_USER_DIR}/.zshenv

echo "ln -sf ${DOTFILES_ROOT}/config/zsh/zshrc ${CURRENT_USER_DIR}/.zshrc"
ln -sf ${DOTFILES_ROOT}/config/zsh/zshrc ${CURRENT_USER_DIR}/.zshrc

echo "ln -sf ${DOTFILES_ROOT}/config/config/vim/vimrc ${CURRENT_USER_DIR}/.vimrc"
ln -sf ${DOTFILES_ROOT}/config/config/vim/vimrc ${CURRENT_USER_DIR}/.vimrc

