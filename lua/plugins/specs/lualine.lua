return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = require("catppuccin.utils.lualine")(),
                    section_separators = "",
                    component_separators = "",
                    globalstatus = true,
                },
            })
        end,
    }
}
