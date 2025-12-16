return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = false,

                integrations = {
                    lualine = true,
                    treesitter = true,
                    nvimtree = true,
                    telescope = true,
                    gitsigns = true,
                }

            })

            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
