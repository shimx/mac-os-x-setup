#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.vim.ime_new 1
/bin/echo -n .
$cli set private.vim.ime_off_ESC 1
/bin/echo -n .
$cli set remap.holdcommandQ 1
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set repeat.wait 8
/bin/echo -n .
/bin/echo
