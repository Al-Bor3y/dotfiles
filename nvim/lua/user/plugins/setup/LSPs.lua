vim.diagnostic.config({

	update_in_insert = true,

	float = {
		header = "",
		footer = "",
		scope = "cursor",
		source = 'always', -- Or 'if_many', 'never'
		border = 'rounded', -- Or 'single', 'double', 'shadow'
		focusable = false,
	},

	virtual_text = {

--		severity = { max = vim.diagnostic.severity.WARN },

		prefix = '●',
		spacing = 0,
	},

	signs = false

})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {"ruff", "pyright", "lua_ls", "jsonls", "intelephense", "bashls"}

local client = require("lspconfig")

local configs = {

--	jedi_language_server = {
--
--		capabilities = capabilities,
--
--		settings = {
--
--			jedi = {
--
--				diagnostics = {
--
----					enable = false
--
--				}
--
--			}
--
--		}
--
--	},

	intelephense = {

		capabilities = capabilities,

		root_dir = client.util.root_pattern(".git", "composer.json", "*.php")

	},

	default = {

		capabilities = default_capabilities

	}
}

local server_config

for _, server in ipairs(servers) do

	if configs[server] then

		server_config = configs[server]

	else

		server_config = configs[default]

	end

	client[server].setup{ server_config }

end

require('lspsaga').setup{

	ui = {

		border = "rounded",

--	    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),


	},

	lightbulb = {
		enable = false
	},

	breadcrumbs = {
		delay = 0
	}

}



