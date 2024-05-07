local ascii_arts = require("assets.ascii.ascii_art")

return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      math.randomseed(os.time())

      local random_index = math.random(#ascii_arts)
      local logo = ascii_arts[random_index]

      local fortune = io.popen("misfortune -s", "r")
      local fortune_output
      if fortune then
        fortune_output = fortune:read("*a")
        fortune:close()
      else
        fortune_output = "No fortune today."
      end

      logo = logo .. "\n" .. fortune_output .. "\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
