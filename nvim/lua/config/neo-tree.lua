require("neo-tree").setup({
  window = {
    position = "right",
    mappings = {
      ["l"] = "noop",
    },
  },
  filesystem = {
    filtered_items = {
      --visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        ".github",
        ".git",
        "package-lock.json",
      },
    },
  },
})
