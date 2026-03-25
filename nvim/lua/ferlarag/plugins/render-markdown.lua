return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	keys = {
		{ "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown render" },
	},
	config = function()
		-- Subtle highlight groups that match poimandres' muted palette
		local colors = {
			{ group = "RenderMarkdownH1Bg", bg = "#1a2332" }, -- deep navy
			{ group = "RenderMarkdownH2Bg", bg = "#1a2a2a" }, -- deep teal
			{ group = "RenderMarkdownH3Bg", bg = "#1f1a2e" }, -- deep purple
			{ group = "RenderMarkdownH4Bg", bg = "#2a1f1f" }, -- deep warm
			{ group = "RenderMarkdownH5Bg", bg = "#1a2332" },
			{ group = "RenderMarkdownH6Bg", bg = "#1f1a2e" },
			{ group = "RenderMarkdownH1", fg = "#89ddff" },   -- soft cyan
			{ group = "RenderMarkdownH2", fg = "#5de4c7" },   -- soft teal
			{ group = "RenderMarkdownH3", fg = "#d0679d" },   -- soft pink
			{ group = "RenderMarkdownH4", fg = "#fffac2" },   -- soft yellow
			{ group = "RenderMarkdownH5", fg = "#89ddff" },
			{ group = "RenderMarkdownH6", fg = "#d0679d" },
			{ group = "RenderMarkdownCode", bg = "#171922" }, -- slightly lighter than bg
			{ group = "RenderMarkdownBullet", fg = "#506477" },
			{ group = "RenderMarkdownQuote", fg = "#506477" },
			{ group = "RenderMarkdownDash", fg = "#303340" },
			{ group = "RenderMarkdownTableHead", fg = "#5de4c7" },
			{ group = "RenderMarkdownTableRow", fg = "#506477" },
			{ group = "RenderMarkdownChecked", fg = "#5de4c7" },
			{ group = "RenderMarkdownUnchecked", fg = "#506477" },
		}
		for _, c in ipairs(colors) do
			vim.api.nvim_set_hl(0, c.group, { fg = c.fg, bg = c.bg })
		end

		require("render-markdown").setup({
			heading = {
				icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
			code = {
				style = "full",
				highlight = "RenderMarkdownCode",
				border = "thin",
			},
			bullet = {
				highlight = "RenderMarkdownBullet",
			},
			dash = {
				highlight = "RenderMarkdownDash",
			},
			quote = {
				highlight = "RenderMarkdownQuote",
			},
			checkbox = {
				checked = { highlight = "RenderMarkdownChecked" },
				unchecked = { highlight = "RenderMarkdownUnchecked" },
			},
		})
	end,
}
