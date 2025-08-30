local colorscheme = require("user.theme")

require(colorscheme).setup{

	transparent_background = true,

	integrations = {
		notify = true,
		lsp_saga = true,
		neotree = true,
		noice = true
	},

	term_colors = true

}

vim.cmd.colorscheme "catppuccin"
