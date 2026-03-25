return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "dawn",
			dim_inactive_windows = true,
			styles = {
				italic = true,
				transparency = true,
			},
		})
	end,

	init = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
