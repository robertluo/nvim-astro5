-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.lua" },

  -- ----------------------------------------------
  -- Test changes in local fork of astrocommunity in ~/project/astrocommunity
  -- { "AstroNvim/astrocommunity", dev = true },
  -- Or specify path to Astrocommunity fork
  -- { dir = "~/projects/community/neovim/astrocommunity" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Packs
  -- Treesitter: clojure , Lsp: clojure-lsp, Lint/format:
  { import = "astrocommunity.pack.clojure" },
  -- Disable plugins contained in the clojure pack
  -- { "nvim-parinfer", enabled = false },
  { "nvim-treesitter-sexp", enabled = false },
  -- { "nvim-treesitter-sexp", enabled = vim.fn.has "nvim-0.11" == 0 },
  -- Additional plugin:
  -- { "julienvincent/nvim-paredit" }, -- requires testing
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Source Control
  -- Neogit interactive git client
  { import = "astrocommunity.git.neogit" },
  -- ----------------------------------------------
}
