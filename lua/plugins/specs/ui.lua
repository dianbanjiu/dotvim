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
                    lualine = {},
                    treesitter = true,
                    nvimtree = true,
                    telescope = true,
                    gitsigns = true,
                    coc_nvim = true,
                }

            })

            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
