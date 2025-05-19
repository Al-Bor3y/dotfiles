local colorscheme = require("user.theme")

--local palette = require(colorscheme .. ".palette")

require(colorscheme).setup{

	flavour = "mocha",

--	color_overrides = {
--		mocha = {
--			base = "#11111b",
--		}
--
--	},

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
