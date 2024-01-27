local nvim_notify = require("notify")
nvim_notify.setup {
  -- Animation style
  stages = "slide",
  -- Default timeout for notifications
  timeout = 1500,
  background_colour = "#2E3440",
}

vim.notify = nvim_notify
