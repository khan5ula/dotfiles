-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})
]])
