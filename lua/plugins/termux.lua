-- ------------------------------------------
-- Termux (Android) Overrides
--
-- Configure LSP language servers to run locally
-- as mason fails to install these servers
-- Clojure LSP server
-- Lua Language server
-- ------------------------------------------

-- ------------------------------------------
-- INFO: conditional only loads config if
-- `OS_TERMUX` is true
--
local termux = vim.env.OS_TERMUX
if not termux then return {} end
-- ------------------------------------------

-- ------------------------------------------
---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- INFO: prevent Mason loading Clojure & Lua LSP servers
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "clojure-lsp",
        condition = function() return not termux end,
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    -- INFO: Use local Clojure & Lua LSP servers
    opts = {
      -- Configuration table of features provided by AstroLSP
      features = {
        autoformat = true, -- enable or disable auto formatting on start
        codelens = true, -- enable/disable codelens refresh on start
        inlay_hints = false, -- enable/disable inlay hints on start
        semantic_tokens = true, -- enable/disable semantic token highlighting
      },
      -- enable servers that you already have installed without mason
      servers = {
        -- "pyright"
        "clojure-lsp",
        "lua-language-server",
      },
    },
  },
}
-- ------------------------------------------
