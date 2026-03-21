-- return {
-- 	"zenbones-theme/zenbones.nvim",
-- 	-- Optionally install Lush. Allows for more configuration or extending the colorscheme
-- 	-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
-- 	-- In Vim, compat mode is turned on as Lush only works in Neovim.
-- 	dependencies = "rktjmp/lush.nvim",
-- 	lazy = false,
-- 	priority = 1001,
-- 	config = function()
-- 		vim.g.zenbones_darken_comments = 45
-- 		vim.opt.termguicolors = true
-- 		vim.o.background = "dark" -- "dark" or "light"
-- 		vim.cmd.colorscheme("nordbones") -- or any variant below
-- 	end,
-- }

--[[ return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha", -- default dark flavor
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
} ]]

return {
	"olivercederborg/poimandres.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("poimandres").setup({
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,
			bold_vert_split = false,
			dim_nc_background = true,
			-- leave this setup function empty for default config
			-- or refer to the configuration section
			-- for configuration options
		})
	end,

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme poimandres")
	end,
}
