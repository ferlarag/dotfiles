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

		-- telescope
		local ok, oxo = pcall(require, "oxocarbon")
		if ok then
			local c = oxo.oxocarbon
			vim.api.nvim_set_hl(0, "TelescopeBorder",       { fg = c.base02, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "TelescopeNormal",        { bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal",  { bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { fg = c.base02, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "TelescopePromptPrefix",  { fg = c.base08, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle",  { fg = c.base03, bg = "#F2F4F8" })

			-- noice notifications
			vim.api.nvim_set_hl(0, "NoicePopup",             { fg = c.base04, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "NoicePopupBorder",       { fg = c.base02, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "NoiceMini",              { fg = c.base04, bg = "#F2F4F8" })
			vim.api.nvim_set_hl(0, "NoiceFormatProgressDone",{ fg = c.base00, bg = c.base13 })
			vim.api.nvim_set_hl(0, "NoiceFormatProgressTodo",{ fg = c.base04, bg = c.base02 })
		end
	end,
}
