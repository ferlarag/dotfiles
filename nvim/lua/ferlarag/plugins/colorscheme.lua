return {
	"nyoom-engineering/oxocarbon.nvim",
	name = "oxocarbon",
	lazy = false,
	priority = 1000,

	init = function()
		vim.cmd("colorscheme oxocarbon")
	end,
}
