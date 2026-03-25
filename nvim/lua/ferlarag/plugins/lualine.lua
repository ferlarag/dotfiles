return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "rose-pine",
				icons_enabled = true,
				section_separators = {},
				component_separators = {},
				always_divide_middle = true,
				globalstatus = false,
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "diagnostics", "diff", "filetype" },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		},
	},
}
