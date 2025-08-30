require("lualine").setup {
	options = {
		component_separators = "",
		section_separators = {
			left = "",
			right = ""
		},
	},
	sections = {
		lualine_a = {
			{ "mode",
				separator = { left = "" },
				right_padding = 2
			}
		},
		lualine_b = { "branch" },
		lualine_c = {
			"%=",
			{ "diagnostics",
				sources = { "nvim_lsp" },
				update_in_insert = true,
			}
		},
		lualine_x = {
			{
				"copilot",
				show_colors = true
			}
		},
		lualine_y = {
--			{ "lsp_status",
--				separator = " & ",
--				ignore_lsp = { "copilot" }
--			}
		},
		lualine_z = {
			{ "location",
				separator = { right = "" },
				left_padding = 2
			}
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
}
