#!/bin/bash

set -ue

echo "git config --global user.name $1"
git config --global user.name $1
git config user.name

echo "git config --global user.email $2"
git config --global user.email $2
git config user.email

echo "make any alias"
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.sth stash
git config --global pager.branch cat

