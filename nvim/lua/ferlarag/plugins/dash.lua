return {
	"mrjones2014/dash.nvim",
	build = "make install",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"Dash",
		"DashWord",
	},
	keys = {
		{ "<leader>ds", "<cmd>DashWord<cr>", desc = "Search Dash for word under cursor" },
		{ "<leader>dS", "<cmd>Dash<cr>", desc = "Search Dash" },
	},
	opts = {},
}
