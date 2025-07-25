return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      qwen3 = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "qwen3:30b",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "qwen3",
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "deepseek",
      },
    },
  },
}
