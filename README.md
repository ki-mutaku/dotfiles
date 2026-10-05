# dotfiles

私の設定ファイル（dotfiles）リポジトリです。

## 管理しているツール

- **[Zsh](https://www.zsh.org/)** (`zsh/`)
- **[Neovim](https://neovim.io/)** (`nvim/`)
- **[WezTerm](https://wezfurlong.org/wezterm/)** (`wezterm/`)
- **[Hammerspoon](https://www.hammerspoon.org/)** (`hammerspoon/`)
- **[Sheldon](https://sheldon.cli.rs/)** (`sheldon/`)

## ディレクトリ構成

各ツールの設定ファイルは、GNU Stowを用いた容易な管理ができるよう、ホームディレクトリ（`~/`）から見たパス構造をそのまま維持して配置されています。

## セットアップ手順

設定ファイルの配置には、シンボリックリンクを管理するツール [GNU Stow](https://www.gnu.org/software/stow/) の利用を推奨します。

### 1. リポジトリのクローン

```bash
git clone https://github.com/tutaya/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. GNU Stow のインストール (macOS)

```bash
brew install stow
```

### 3. 設定ファイルの配置（シンボリックリンクの作成）

`stow` コマンドを使用して、各ツールのディレクトリを展開します。

```bash
cd ~/dotfiles

# 各ツールの設定を反映
stow zsh
stow nvim
stow wezterm
stow sheldon
stow hammerspoon
```

> **Note**: もし既存の設定ファイルが存在しコンフリクトする場合は、事前に既存のファイルをバックアップまたは削除してから `stow` コマンドを実行してください。

### Stowを使わず手動でリンクを張る場合

Stowを使わない場合は、以下のように手動でシンボリックリンクを作成してください。

```bash
# Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/aliases.zsh ~/aliases.zsh

# Neovim
mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/nvim/.config/nvim/lua ~/.config/nvim/lua
ln -sf ~/dotfiles/nvim/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/.config/nvim/lazyvim.json ~/.config/nvim/lazyvim.json

# WezTerm
mkdir -p ~/.config/wezterm
ln -sf ~/dotfiles/wezterm/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -sf ~/dotfiles/wezterm/.config/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua

# Sheldon
mkdir -p ~/.config/sheldon
ln -sf ~/dotfiles/sheldon/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

# Hammerspoon
mkdir -p ~/.hammerspoon
ln -sfn ~/dotfiles/hammerspoon/.hammerspoon/Spoons ~/.hammerspoon/Spoons
ln -sf ~/dotfiles/hammerspoon/.hammerspoon/init.lua ~/.hammerspoon/init.lua
