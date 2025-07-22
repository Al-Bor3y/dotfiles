local cmp = require'cmp'

cmp.setup({

--	view = {
--		entries = {name = 'custom', selection_order = 'near_cursor' }
--	},

	formatting = {

--	    format = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),

		format = require('lspkind').cmp_format()
	},

	performance = {
		max_view_entries = 10,
		debounce = 0, -- default is 60ms
		throttle = 0, -- default is 30ms
	},

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({

		['<C-Space>'] = cmp.mapping.complete(),

		["<C-e"] = cmp.mapping.abort(),

		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },

		{ name = 'luasnip' },

		{ name = 'buffer' },

		{ name = 'path' },

		{ name = "nerdfont" },

--		{ name = "nvim_lsp_signature_help" },

		{ name = 'nvim_lua' }

	})

})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
			{ name = 'cmdline' }
		}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

require("nvim-autopairs").setup()
-- If you want to automatically add `(` after selecting a function or method
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
