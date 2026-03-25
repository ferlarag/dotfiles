return {
	"nyoom-engineering/oxocarbon.nvim",
	name = "oxocarbon",
	lazy = false,
	priority = 1000,

	init = function()
		vim.cmd("colorscheme oxocarbon")
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

		-- nvim-tree
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "NONE" })

		-- lualine
		vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "NONE" })

		-- other UI elements
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#dde1e6" })
		vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#dde1e6" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
	end,
}
