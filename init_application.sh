#!/bin/bash

set -ue

CURRENT_USER_DIR=$(cd ~/; pwd)
MACOSSETUP_ROOT=${CURRENT_USER_DIR}/ghq/github.com/shimx/mac-os-x-setup

echo "mkdir ${CURRENT_USER_DIR}/.config"
mkdir ${CURRENT_USER_DIR}/.config

echo 'mkdir ${CURRENT_USER_DIR}/Library/Application Support/iTerm2'
mkdir -p ${CURRENT_USER_DIR}/Library/Application\ Support/iTerm2

echo 'make symlinks'

echo "ln -sf ${MACOSSETUP_ROOT}/roles/mac/files/karabiner ${CURRENT_USER_DIR}/.config/karabiner"
ln -sf ${MACOSSETUP_ROOT}/roles/mac/files/karabiner ${CURRENT_USER_DIR}/.config/karabiner

echo "ln -sf ${MACOSSETUP_ROOT}/roles/mac/files/Library/Application\ Support/iTerm2/DynamicProfiles ${CURRENT_USER_DIR}/Library/Application\ Support/iTerm2/DynamicProfiles"
ln -sf ${MACOSSETUP_ROOT}/roles/mac/files/Library/Application\ Support/iTerm2/DynamicProfiles ${CURRENT_USER_DIR}/Library/Application\ Support/iTerm2/DynamicProfiles

echo 'Install ricty fonts'
cp -f $(brew --cellar ricty)/*/share/fonts/Ricty*.ttf ${CURRENT_USER_DIR}/Library/Fonts && fc-cache -vf

