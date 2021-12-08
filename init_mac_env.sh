#!/bin/bash

set -ue

# キー設定
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 13

# 拡張子
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles TRUE

# パスバー表示
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバー表示
defaults write com.apple.finder ShowStatusBar -bool true

# 英数のときにキー長押しでウムラウトとかのポップアップを出さなくしてキーリピートが効くように
defaults write -g ApplePressAndHoldEnabled -bool false

# ~/Library ディレクトリを見えるようにする
chflags nohidden ~/Library

# /Volumes ディレクトリを見えるようにする
sudo chflags nohidden /Volumes

# Safariデバッグメニュー
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# 再起動
killall Finder
killall -kill SystemUIServer
