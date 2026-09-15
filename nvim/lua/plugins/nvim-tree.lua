return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                renderer = {
                    icons = {
                        show = {
                            file = false,
                            folder = false,
                            folder_arrow = false,
                            git = false,
                        },
                    },
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")

                    api.map.on_attach.default(bufnr)

                    local function opts(desc)
                        return {
                            desc = "nvim-tree: " .. desc,
                            buffer = bufnr,
                            noremap = true,
                            silent = true,
                            nowait = true,
                        }
                    end

                    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))

                    vim.keymap.set("n", "t", api.node.open.tab, opts("Open tab"))

                    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open vertical split"))

                    vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open horizontal split"))
                end,
            })

            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
                desc = "Toggle file tree",
            })
        end,
    }
}
