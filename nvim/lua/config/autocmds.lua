-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable built-in spellchecking for Markdown
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lazyvim_user_markdown", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Disable single quote pairing in Rust
local rust_group = vim.api.nvim_create_augroup("Rust_disable_single_quote", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = rust_group,
  callback = function()
    if MiniPairs ~= nil then
      MiniPairs.unmap("i", "'", "''")
    end
  end,
  desc = "Disable single quote Rust",
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = vim.api.nvim_create_augroup("Rust_disable_single_quote_lazyload", { clear = true }),
  callback = function(event)
    if event.data == "mini.pairs" then
      vim.api.nvim_exec_autocmds("FileType", {
        pattern = "rust",
        group = rust_group,
      })
    end
  end,
  desc = "Disable single quote Rust",
})
