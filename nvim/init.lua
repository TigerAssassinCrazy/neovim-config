vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = {
    space = '·',
    tab = '→ ',
}

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set("n", "<leader>l", "<cmd>set list!<CR>", {
    desc = "Toggle whitespace",
})

vim.keymap.set('n', '<leader>tt', ':split | terminal<CR>', {
    desc = 'Open terminal',
})

vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>')

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.cmd("startinsert")
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "term://*",
    callback = function()
        vim.cmd("startinsert")
    end,
})

require("config.lazy")

