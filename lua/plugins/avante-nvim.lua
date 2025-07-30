return {
  "yetone/avante.nvim",
  opts = {
    provider = "lm_studio_qwen3",
    providers = {
      lm_studio_qwen3 = {
        endpoint = "http://localhost:1234/v1",
        model = "qwen/qwen3-30b-a3b-2507",
        context_window = 262144,
        __inherited_from = "openai",
      },
    },
  },
}
