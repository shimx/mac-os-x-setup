Mac OS X 初期環境構築
==============

## 参照

* [Mac の開発環境構築を自動化する (2015 年初旬編)](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
* [Mac OS Xの環境構築を自動化する(2016年度初旬編)](http://dev.classmethod.jp/server-side/ansible/automate-build-mac-osx-env-by-ansible/)
* https://github.com/knakayama/mac-os-x-setup
* [Macの環境構築を自動化してOS再インストールに備える](http://patorash.hatenablog.com/entry/2017/09/18/021352)

素晴らしすぎて感謝しかない…

## 前提条件

* 途中、iTerm2の設定を変えるので、ansibleの実行はMacデフォルトのターミナルで行うこと
* アプリごとに個々にアップデートしたいのでbrew-caskは使わない方針
* 以下OS X High Sierra(10.13.1)で動作確認済
* システムをアップデートしておく
* Xcodeをインストールしておく
* Xcodeコマンドラインツールをインストールしておく
```bash
$ xcode-select --install
```
* [homebrewインストール](http://brew.sh/)
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 設定ファイルをclone

* [githubの自分のmac-os-x-setup](https://github.com/shimx/mac-os-x-setup)
```bash
$ mkdir -p ~/.ghq/github.com/shimx
$ git clone https://github.com/shimx/mac-os-x-setup ~/.ghq/github.com/shimx/mac-os-x-setup
```

## Ansible実行

* pyenv設定、python3系インストール
```bash
$ brew install pyenv pyenv-virtualenv gcc
$ cat >>~/.bash_profile <<'EOT'
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv";
  export PATH="$PYENV_ROOT/bin:$PATH";
  eval "$(pyenv init -)";
fi
EOT
$ cat >>~/.bashrc <<'EOT'
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv";
  export PATH="$PYENV_ROOT/bin:$PATH";
  eval "$(pyenv init -)";
fi
EOT
$ exec $SHELL
$ pyenv install 3.<python-version>
$ pyenv global 3.<python-version>
$ pyenv virtualenv general-env
$ pyenv activate general-env
```

* [Ansible](https://github.com/ansible/ansible)実行
```bash
$ cd ~/.ghq/github.com/shimx/mac-os-x-setup
$ pip install -r requirements.txt
$ HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook site.yml -vvvv --ask-become-pass
```
アプリケーションによって /Applicationsだったり、 ~/Applicationsだったりにシンボリックリンクリンクが作られてしまうそうなのでappdir指定

## その他

* 必要そうなアプリをAppStoreや公式サイトからダウンロード
  - Google日本語入力
  - Google Chrome
  - Firefox
  - Dropbox
  - Clipy
  - Karabiner-Elements
  - iTerm2
  - Atom
  - etc.
* ChromeとFirefoxの同期
* Karabiner-Elementsの設定読み込み
* iTerm2の設定読み込み
* SSHの秘密鍵を設定
* ログイン時起動するアプリを設定
