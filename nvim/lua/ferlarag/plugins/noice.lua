return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#F2F4F8",
      render = "wrapped-compact",
      stages = "static",
      timeout = 3000,
      max_width = 60,
      icons = {
        ERROR = " ",
        WARN  = " ",
        INFO  = " ",
        DEBUG = " ",
        TRACE = "✎ ",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = true,
        view = "notify",
      },
      views = {
        hover = {
          border = { style = "rounded" },
        },
        cmdline_popup = {
          border = { style = "rounded" },
        },
        notify = {
          border = { style = "rounded" },
          win_options = { winblend = 0 },
        },
        mini = {
          win_options = { winblend = 0 },
        },
      },
    },
  },
}
