vim.o.encoding = "utf-8"
vim.o.number = true
vim.o.relativenumber = true

vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.list = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.o.ruler = true
vim.o.smartcase = true
vim.o.showmatch = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.cursorline = true

-- LuaRocksのパス追加 (Jupyter環境用)
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- Neovim本体がPythonプラグイン（Moltenなど）を動かすための設定
-- プロジェクトごとの仮想環境ではなく、Neovim専用の共通環境を指定します
vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/.virtualenvs/neovim/bin/python"
