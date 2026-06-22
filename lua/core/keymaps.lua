local keymap = vim.keymap

keymap.set("v", "p", '"_dP')
keymap.set("v", "d", '"_d')
keymap.set("n", "x", '"_x')
keymap.set("n", "X", '"_X')

--- nvim tree ---

keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

--- Telescope ---

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<Space><Space>", "<cmd>Telescope<CR>")

--- COC ---
-- 辅助函数：检查光标前是否为空白字符
local function check_back_space()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end
-- 1. 使用 <Tab> 触发补全、循环建议或跳至下一个补全项
-- 注意：需要设置 expr = true 来让返回的字符串被执行
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = true }
keymap.set("i", "<TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#next"](1)
  end
  if check_back_space() then
    return "<Tab>"
  end
  return vim.fn["coc#refresh"]()
end, opts)

keymap.set("i", "<S-TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#prev"](1)
  end
  return "<S-TAB>"
end, opts)

-- 2. 使用 <CR> (回车) 确认补全
keymap.set("i", "<cr>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  end
  return "\r"
end, opts)
-- 3. LSP 相关跳转
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- 4. 使用 K 显示文档悬浮窗
function _G.show_docs()
  local cw = vim.fn.expand "<cword>"
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command("h " .. cw)
  elseif vim.api.nvim_eval "coc#rpc#ready()" then
    vim.fn.CocActionAsync "doHover"
  else
    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
