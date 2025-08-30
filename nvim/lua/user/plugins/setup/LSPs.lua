vim.diagnostic.config({

	update_in_insert = true,

	float = {
		header = "",
		footer = "",
		scope = "cursor",
		source = "if_many", -- Or "if_many", "never"
		border = "rounded", -- Or "single", "double", "shadow"
		focusable = false,
	},

	virtual_text = {
		prefix = "●",
		spacing = 0,
	},

	signs = false

})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "rust_analyzer", "clangd", "basedpyright", "lua_ls", "jsonls" }

local servers_settings = {
  intelephense = {
    root_dir = vim.fs.root(0, { ".git", "composer.json", "*.php" }),
  },
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = function(client)
    vim.notify(client.name .. ": Attached.")
  end,
})

for _, server in ipairs(servers) do
  if servers_settings[server] then
    vim.lsp.config(server, servers_settings[server])
  end
  vim.lsp.enable(server)
end

require("lspsaga").setup{
	ui = {
		border = "rounded",
	    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},

	diagnostic = {
		extend_relatedInformation = true
	},

	lightbulb = {
		enable = false
	},

	breadcrumbs = {
		delay = 0
	}
}
