return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },

        -- 启动时不要抢占整个窗口
        hijack_netrw = true,
        hijack_cursor = true,

        update_focused_file = {
            enable = true,
            update_root = true,
        },
        
        actions = {
            open_file = {
                quit_on_open = false, -- 打开文件后不关闭tree
            }
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              git = true,
            },
          },
        },
        git = {
          enable = true,
        },
      })
    end,
  },
}
