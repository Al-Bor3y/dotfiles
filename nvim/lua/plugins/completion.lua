return {

	{

		"hrsh7th/nvim-cmp",

		dependencies = {

			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"chrisgrieser/cmp-nerdfont",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua"

		}

	},

	{

		"L3MON4D3/LuaSnip",

		dependencies = {

			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"

		}

	},

	{

		'windwp/nvim-autopairs',
		event = "InsertEnter",

	},

	{

		"brenoprata10/nvim-highlight-colors",

		opts = {}

	}

}
