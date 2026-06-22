vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- 禁用 netrw，避免打开目录时全屏
vim.g.loaded_netrw = 1
vim.g.loaded_nwtrwPlugin = 1

require "core"
require "plugins"
