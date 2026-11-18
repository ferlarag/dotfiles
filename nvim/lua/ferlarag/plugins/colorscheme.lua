return {
	"OldJobobo/miasma.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- In Rex, use the active Rex theme (colors/rex.lua)
		if vim.env.TERM_PROGRAM == "rex" then
			vim.cmd.colorscheme("rex")
			return
		end

		vim.opt.background = "dark"
		vim.cmd.colorscheme("miasma")

		local transparent_groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"Pmenu",
			"Terminal",
			"EndOfBuffer",
			"FoldColumn",
			"Folded",
			"SignColumn",
			"LineNr",
			"CursorLineNr",
			"WhichKeyFloat",
			"TelescopeBorder",
			"TelescopeNormal",
			"TelescopePromptBorder",
			"TelescopePromptTitle",
			"NvimTreeNormal",
			"NvimTreeNormalNC",
			"NvimTreeVertSplit",
			"NvimTreeWinSeparator",
			"NvimTreeEndOfBuffer",
		}

		local function apply_transparency()
			for _, group in ipairs(transparent_groups) do
				local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
				if ok then
					highlight.bg = nil
					vim.api.nvim_set_hl(0, group, highlight)
				end
			end
		end

		apply_transparency()
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = vim.schedule_wrap(apply_transparency),
		})
	end,
}
