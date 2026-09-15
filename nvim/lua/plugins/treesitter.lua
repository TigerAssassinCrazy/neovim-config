return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',

        config = function()

        require('nvim-treesitter').setup({
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath('data') .. '/site'
        })

        require('nvim-treesitter').install({ 
                'rust',
                'javascript',
                'zig', 
                'c',
                'cpp',
                'python',
                'bitbake',
                'go',
                'bash',
                'markdown',
                'toml',
                'json'
        }):wait(300000)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })
    end,
    },
}
