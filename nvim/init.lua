-- bootstrap lazy.nvim, LazyVim and your plugins

package.path = package.path .. ";/home/kristian/.config/nvim/?.lua"

require("config.lazy")

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})
]])
