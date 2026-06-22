return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "➜ ",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
        },
      }
    end,
  },
}
