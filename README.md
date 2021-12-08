Mac OS X 初期環境構築
==============

## 参照

* [Mac の開発環境構築を自動化する (2015 年初旬編)](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
* [Mac OS Xの環境構築を自動化する(2016年度初旬編)](http://dev.classmethod.jp/server-side/ansible/automate-build-mac-osx-env-by-ansible/)
* https://github.com/knakayama/mac-os-x-setup
* [Macの環境構築を自動化してOS再インストールに備える](http://patorash.hatenablog.com/entry/2017/09/18/021352)

素晴らしすぎて感謝しかない…

## 前提条件

* M1になったのでansible諦めてshell scriptに
* 途中、iTerm2の設定を変えるので、ansibleの実行はMacデフォルトのターミナルで行うこと
* アプリごとに個々にアップデートしたいのでbrew-caskは使わない方針
* システムをアップデートしておく
* Xcodeをインストールしておく
* Xcodeコマンドラインツールをインストールしておく
```bash
xcode-select --install
```
* [homebrewインストール](http://brew.sh/)

## 設定ファイルをclone

* [githubの自分のmac-os-x-setup](https://github.com/shimx/mac-os-x-setup)
```bash
mkdir -p ~/ghq/github.com/shimx
```
```bash
git clone https://github.com/shimx/mac-os-x-setup ~/ghq/github.com/shimx/mac-os-x-setup
```

## 設定shell script実行

### git configの最低限の設定
```bash
bash ./init_git_config.sh <ユーザー名> <メールアドレス>
```

### dotfiles設定
```bash
bash ./init_dotfiles.sh
```

### homebrewでインストール
```bash
bash ./homebrew_install.sh
```

### Mac設定実行

バージョンによっては動かないかも
```bash
bash ./init_mac_env.sh
```

### アプリケーション設定

事前にiTerm2とKarabinerを一度起動してから閉じること
```bash
bash ./init_application.sh
```

## Ansible実行

この項目は現在廃止

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

* Mojaveでzlibが有効でないとpyenv installできなかった場合、Mojave用のmacOS SDK headerを入れる  
参照: https://qiita.com/zreactor/items/c3fd04417e0d61af0afe
```bash
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

* [Ansible](https://github.com/ansible/ansible)実行
```bash
$ cd ~/ghq/github.com/shimx/mac-os-x-setup
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
* SSHの秘密鍵を設定
* zsh_historyとかコピー
* zshenv.localとか設定
* ログイン時起動するアプリを設定
