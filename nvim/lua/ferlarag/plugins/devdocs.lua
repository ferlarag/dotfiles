return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = {
		"DevdocsFetch",
		"DevdocsInstall",
		"DevdocsUninstall",
		"DevdocsOpen",
		"DevdocsOpenFloat",
		"DevdocsOpenCurrent",
		"DevdocsOpenCurrentFloat",
		"DevdocsUpdate",
		"DevdocsUpdateAll",
	},
	keys = {
		{ "<leader>dd", "<cmd>DevdocsOpenCurrentFloat<cr>", desc = "Open devdocs for current filetype" },
		{ "<leader>dD", "<cmd>DevdocsOpenFloat<cr>", desc = "Open devdocs (all)" },
	},
	opts = {
		float_win = {
			relative = "editor",
			height = 35,
			width = 120,
			border = "rounded",
		},
		after_open = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<cr>", { silent = true })
		end,
	},
}
