return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			disable_netrw = true,
			hijack_netrw = true,
			-- open_on_setup = false,
			-- ignore_ft_on_setup = {},
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			filters = {
				dotfiles = false,
				custom = { ".DS_Store" },
				exclude = { ".gitignore", ".github", ".env" },
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			renderer = {
				root_folder_label = false,
				icons = {
					git_placement = "after",
					padding = "  ",
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "➜",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			view = {
				width = 35,
				-- hide_root_folder = true,
				side = "left",
				--[[ mappings = {
					custom_only = false,
					list = {
						{ key = "<C-k>", action = "" },
						{ key = "J", action = "first_sibling" },
						{ key = "O", action = "expand_all" },
						{ key = "K", action = "last_sibling" },
						{ key = "S", action = "system_open" },
						{ key = "s", action = "search_node" },
						{ key = "cd", action = "cd" },
					},
				}, ]]
				number = false,
				relativenumber = false,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					window_picker = {
						enable = false,
					},
				},
			},
		})

		vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#303030", bg = "NONE" })

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
