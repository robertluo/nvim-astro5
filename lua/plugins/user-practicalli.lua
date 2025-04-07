-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ------------------------------------------
-- Practicalli specific customisations
--
-- Startup dashboard banner
-- `fd` as alternate `ESC` key mapping (better-escape.nvim)
-- Everforest colorscheme
-- Custom global options & key mpapings (via astrocore)
-- ------------------------------------------

-- INFO: Create a `lua/plugins/your-name.lua` for significant changes

-- INFO: Files under `lua/plugins/*.lua` load in alphabetical order,
-- so plugin overrides should be the last file to load

-- INFO: Skip this config if `PRACTICALLI_ASTRO` environment variable set to false
local practicalli = vim.env.PRACTICALLI_ASTRO
if practicalli == "false" then return {} end

