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
  -- Colorscheme (Themes)
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Editing Support
  -- Multiple Cursors
  -- `gm` VM_Leader set in 'lua/plugins/user-practicalli.lua'
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- ----------------------------------------------
  -- Motion plugins
  { import = "astrocommunity.motion.nvim-surround" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Packs
  -- Treesitter: clojure , Lsp: clojure-lsp, Lint/format:
  { import = "astrocommunity.pack.clojure" },
  -- Disable plugins contained in the clojure pack
  { "nvim-treesitter-sexp", enabled = false },
  -- { "nvim-treesitter-sexp", enabled = vim.fn.has "nvim-0.11" == 0 },
  -- Alternative parinfer plugin:
  -- { "julienvincent/nvim-paredit" }, -- requires testing, feedback welcome

  { import = "astrocommunity.pack.json" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Recipes
  -- LSP Mappings for Snacks or Telescope
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- Neovide GUI configuration
  { import = "astrocommunity.recipes.neovide" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Source Control

  -- Neogit interactive git client
  { import = "astrocommunity.git.neogit" },

  -- Diffview with neogit integration
  { import = "astrocommunity.git.diffview-nvim" },

  -- Manage GitHub Gists
  { import = "astrocommunity.git.gist-nvim" },

  -- Open in GitHub / GitLab websites
  { import = "astrocommunity.git.gitlinker-nvim" },

  -- GitHub Pull Requests and Issues
  { import = "astrocommunity.git.octo-nvim" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Utility
  -- rich command prompt
  { import = "astrocommunity.utility.noice-nvim" },
  -- ----------------------------------------------
}
