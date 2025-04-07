-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ------------------------------------------
-- Practicalli preferences
--
-- Startup dashboard banner
-- `fd` as alternate `ESC` key mapping (better-escape.nvim)
-- catppuccin-mocha colorscheme
-- Plugins & configuration
-- Neovim global options & key mpapings
-- ------------------------------------------

-- INFO: Create a `lua/plugins/your-name.lua` for significant changes

-- INFO: Files under `lua/plugins/*.lua` load in alphabetical order,
-- so plugin overrides should be the last file to load

-- INFO: Skip this config if `PRACTICALLI_ASTRO` environment variable set to false
local practicalli = vim.env.PRACTICALLI_ASTRO
if practicalli == "false" then return {} end

---@type LazySpec
return {

  -- ------------------------------------------
  -- UI Customisation
  -- Vertical which-key menu
  {
    "folke/which-key.nvim",
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
    },
  },
  -- Colorscheme (Theme)
  ---@type LazySpec
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "catppuccin-mocha",
    },
  },
  -- Startup Dashboard
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          -- customize the dashboard header
          header = table.concat({
            " ██████╗ ██████╗  █████╗  ██████╗████████╗██╗ ██████╗ █████╗ ██╗     ██╗     ██╗",
            " ██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔══██╗██║     ██║     ██║",
            " ██████╔╝██████╔╝███████║██║        ██║   ██║██║     ███████║██║     ██║     ██║",
            " ██╔═══╝ ██╔══██╗██╔══██║██║        ██║   ██║██║     ██╔══██║██║     ██║     ██║",
            " ██║     ██║  ██║██║  ██║╚██████╗   ██║   ██║╚██████╗██║  ██║███████╗███████╗██║",
            " ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝",
          }, "\n"),
        },
      },
    },
  },
  -- ------------------------------------------
}
