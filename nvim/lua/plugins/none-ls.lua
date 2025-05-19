return {

	"nvimtools/none-ls.nvim",

	config = function()

		local null_ls = require("null-ls")

		null_ls.setup({

			sources = {

				null_ls.builtins.formatting.black

			}

		})

		vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ timeout_ms = 3000 }) end)
		
	end,

	enabled = false

}
