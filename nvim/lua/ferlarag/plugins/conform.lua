return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.formatters_by_ft = opts.formatters_by_ft or {}

		-- keep existing filetypes if they exist
		-- and just add astro:
		opts.formatters_by_ft.astro = { "prettier" }

		-- (optional) if you want to be explicit for others too:
		-- opts.formatters_by_ft.javascript = { "prettier" }
		-- opts.formatters_by_ft.typescript = { "prettier" }
		-- opts.formatters_by_ft.html = { "prettier" }
	end,
}
