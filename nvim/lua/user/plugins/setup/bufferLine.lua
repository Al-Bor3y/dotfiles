require("bufferline").setup {

	options = {

		diagnostics = "nvim_lsp",

		separator_style = "slope",


		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},


		offsets = {
			{
				filetype = "neo-tree",
				text = "Project Explorer",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		}

	}

}
