return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",

                custom_highlights = {
                -- NvimTree
                    NvimTreeNormal = {
                        bg = "#0a0a0a",
                    },

                    NvimTreeNormalNC = {
                        bg = "#0a0a0a",
                    },

                    NvimTreeEndOfBuffer = {
                        bg = "#0a0a0a",
                    },

                    Normal = {
                        bg = "#0a0a0a",
                    },

                    NormalNC = {
                        bg = "#0a0a0a",
                    },

                    WinSeparator = {
                        fg = "#3b4261",
                    },
                    StatusLine = {
                        fg = "#ffffff",
                        bg = "#454b6d",
                    },
                    StatusLineNC = {
                        fg = "#8c98d0",
                        bg = "#303650",
                    },
                },

                integrations = {
                    telescope = true,
                    treesitter = true,
                    nvimtree = true,
                },
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
