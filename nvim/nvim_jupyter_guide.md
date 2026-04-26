# Neovim Jupyter Notebook 操作ガイド (uv & molten-nvim)

このガイドでは、必要なツール（`uv`, `imagemagick`, `luarocks`等）がインストールされている前提で、Neovim 上で Jupyter 環境を立ち上げ、操作する手順を説明します。

## 1. プロジェクトのセットアップ (uv)

作業ディレクトリで仮想環境を作成し、Jupyter カーネルとして Neovim に認識させます。

```bash
# 仮想環境の作成とパッケージ追加
uv venv
uv add pynvim ipykernel jupytext nbformat cairosvg matplotlib pandas

# Neovim用カーネルの登録
# --name はプロジェクト名など、Neovimの初期化時に識別しやすい名前にします
uv run python -m ipykernel install --user --name my-project --display-name "Python (uv-my-project)"
```

## 2. Neovim での基本操作

### ファイルを開く

- `.ipynb` ファイルを直接開きます。`jupytext` により自動的に Python 形式（セル区切りあり）で展開されます。
- 保存 (`:w`) すると、自動的に `.ipynb` 形式に書き戻されます。

### カーネルの起動 (必須)

1. ファイルを開いた直後、コマンドラインで `:MoltenInit` を実行します。
2. 候補の中から、手順1で登録したカーネル名（例: `my-project`）を選択します。

### セル操作と実行

現在の設定で以下のキーバインドが有効です：

| 操作                         | キー         |
| :--------------------------- | :----------- |
| **セルを実行 (Run)**         | `<leader>rc` |
| **実行して次のセルへ移動**   | `<leader>rm` |
| **次のセルへ移動**           | `]h`         |
| **前のセルへ移動**           | `[h`         |
| **Hydraモード (連続操作用)** | `<leader>hj` |

## 3. 画像と結果の表示

- `matplotlib` などのプロット結果は、実行後にバッファ内に直接表示されます。
- 表示された画像を消去したい場合は `:MoltenHideOutput`、再度見たい場合は `:MoltenShowOutput` を使用します。

## 4. 環境の更新

ライブラリを追加した場合は、Neovim を再起動せずに反映可能です。

```bash
# ターミナルで追加
uv add seaborn
# Neovim内で実行
:MoltenRestart
```

## 5. 後片付け

プロジェクトが終了し、登録したカーネルが不要になった場合：

```bash
# カーネル一覧の確認
jupyter kernelspec list

# カーネルの削除
jupyter kernelspec uninstall my-project
```
