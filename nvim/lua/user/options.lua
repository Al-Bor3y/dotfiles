vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.updatetime = 0
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.cursorline = false
vim.opt.encoding = "UTF-8"

vim.opt.termguicolors = true
vim.opt.mousemoveevent = true
vim.g.rustfmt_autosave = true

vim.keymap.set("i", "<leader>/", "<ESC>")
vim.keymap.set("i", "<C-s>", "<cmd>w<CR>")
vim.keymap.set({"n", "i"}, "<C-b>q", "<cmd>bdelete<CR>")
vim.keymap.set({"n", "i"}, "<C-b>Q", "<cmd>bdelete!<CR>")
vim.keymap.set({"n", "i"}, "<C-q>", "<cmd>q<CR>")
vim.keymap.set({"n", "i"}, "<C-x>", "<cmd>x<CR>")
vim.keymap.set("i", "<C-z>", "<cmd>u<CR>")


vim.keymap.set("i", "<C-k>", "<cmd>Lspsaga hover_doc<CR>", {})
vim.keymap.set("n", "<leader>.", "<cmd>Lspsaga code_action<CR>", {})
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", {})
vim.keymap.set("i", "<leader>r", "<cmd>Lspsaga rename<CR>", {})
vim.keymap.set("i", "<C-d>", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
vim.keymap.set({"n", "i"}, "<C-e>", "<cmd>Neotree toggle<CR>")


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Setup the autocmd. to show diagnostics on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        -- Open the diagnostic float
        vim.cmd("Lspsaga show_cursor_diagnostics ++unfocus")
    end,
})
