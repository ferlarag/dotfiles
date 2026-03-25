return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local custom_theme = require("lualine.themes.auto")
			-- Make the lualine background transparent for all modes
			for _, mode in pairs(custom_theme) do
				if mode.c then
					mode.c.bg = "NONE"
				end
			end
			if custom_theme.inactive then
				for _, section in pairs(custom_theme.inactive) do
					section.bg = "NONE"
				end
			end

			require("lualine").setup({
			options = {
				theme = custom_theme,
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
			})
		end,
	},
}
