# Brewfileでパッケージをテキスト管理する方法

## 基本的な流れ

1. インストールを反映する場合=>`brew bundle dump --force`を実行する
2. アンインストールを反映する場合:
  1. 手で不要な行をBrewfileから消す
  2. `brew bundle cleanup --file=brew/.config/brew/Brewfile`で削除対象を確認
  3. 問題なければ`--force`オプションをつけて実行
  4. `brew autoremove`で不要な依存を片付ける

## 反映・書き出し

```bash
  brew bundle dump                    # 現在の状態を Brewfile に書き出す(既存があるとエラー)
  brew bundle dump --force            # 既存の Brewfile を上書き
  brew bundle dump --describe         # 各パッケージの説明をコメントで付ける
  brew bundle dump --file=<path>      # 出力先を指定
  brew bundle dump --formula          # formula だけ(--cask / --tap / --vscode / --mas も同様)
  brew bundle dump --no-vscode        # 特定の種類を除外(--no-mas なども可)
```

## インストール

```bash
  brew bundle                         # Brewfile の内容をインストール(= brew bundle install)
  brew bundle --file=<path>           # 別の Brewfile を指定
  brew bundle --no-upgrade            # 既存のパッケージはアップグレードしない
```

## 確認

```bash
  brew bundle check                   # 未インストールのものがないか確認
  brew bundle check --verbose         # 足りないパッケージを一覧表示
  brew bundle list                    # Brewfile に書かれたパッケージを一覧表示
  brew bundle list --formula          # 種類を指定(--cask / --tap / --vscode など)
  brew bundle exec -- <command>       # Brewfile の環境で コマンドを実行
```
## 削除

`  brew bundle cleanup                 # Brewfile に無いパッケージを表示(削除はしない)
  brew bundle cleanup --force         # 実際に削除する
  brew bundle cleanup --formula       # 種類を限定(--cask など)``bash
