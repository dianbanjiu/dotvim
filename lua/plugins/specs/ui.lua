return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,

                integrations = {
                    treesitter = true,
                    gitsigns = true,
                    coc_nvim = true,
                    noice = true,
                    notify = true,
                    bufferline = true,
                    snacks = true,
                },
            }
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
