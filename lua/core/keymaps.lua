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

