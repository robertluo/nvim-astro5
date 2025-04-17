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

  -- ------------------------------------------
  -- Editor tools

  -- Alternative to Esc key using `fd` key mapping
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      timeout = vim.o.timeoutlen,
      default_mappings = true,
      mappings = {
        i = { f = { d = "<Esc>" } },
        c = { f = { d = "<Esc>" } },
        t = { f = { d = "<Esc>" } },
        v = { f = { d = "<Esc>" } },
        s = { f = { d = "<Esc>" } },
      },
    },
  },
  -- Trim trailing blank space and blank lines
  {
    "cappyzawa/trim.nvim",
    opts = {
      -- ft_blocklist = {"markdown"}, -- filetype not to trim
      -- highlight = true,
      -- highlight_bg = "purple",
    },
  },
  -- Custom snippets (vscode format)
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
  -- Jump between Clojure src and test files
  {
    "rgroli/other.nvim",
    main = "other-nvim",
    opts = {
      mappings = {
        {
          context = "test",
          pattern = function(path)
            local match = vim.fn.matchlist(path, "\\v^(.*)/src/(.{-}_test)@!(.{-}).clj(.?)")
            if #match > 0 then return match end
          end,
          target = "%2/test/%4_test.clj%5",
        },
        {
          context = "implementation",
          pattern = "(.*)/test/(.*)_test.clj(.?)$",
          target = "%1/src/%2.clj%3",
        },
      },
    },
  },
  {
  },
  -- ------------------------------------------

  -- ------------------------------------------
  -- Neovim Options and Key Mappings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        -- configure general options: vim.opt.<key>
        opt = {
          spell = true, -- sets vim.opt.spell
          wrap = true, -- sets vim.opt.wrap
          guifont = "Fira Code:h16", -- neovide font family & size
        },
        -- configure global vim variables: vim.g
        g = {
          -- Neovim language provides - disable language integration not required
          loaded_node_provider = 0,
          loaded_perl_provider = 0,
          loaded_python3_provider = 0,
          loaded_ruby_provider = 0,
          loaded_rust_provider = 0,

          -- Leader key for Visual-Multi Cursors (Multiple Cursors)
          VM_leader = "gm", -- Visual Multi Leader (multiple cursors - user plugin)

          -- Conjure plugin overrides
          -- comment pattern for eval to comment command
          ["conjure#eval#comment_prefix"] = ";; ",
          -- Hightlight evaluated forms
          ["conjure#highlight#enabled"] = true,

          -- show HUD REPL log at startup
          ["conjure#log#hud#enabled"] = false,

          -- auto repl (babashka)
          ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false,
          ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true,
          ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil,
          ["conjure#client#clojure#nrepl#eval#auto_require"] = false,

          -- Test runner: "clojure", "clojuresCRipt", "kaocha"
          ["conjure#client#clojure#nrepl#test#runner"] = "kaocha",

          -- Minimise very long lines slow down:
          -- `g:conjure#log#treesitter` false (true by default)
          -- ["conjure#log##treesitter"] = false,
          -- `g:conjure#log#disable_diagnostics` true (disabled) by default
        },
      },
      mappings = {
        n = {
          -- normal mode key bindings
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,

          -- whick-key sub-menu for Visual-Multi Cursors (Multiple Cursors)
          ["gm"] = { name = "Multiple Cursors" },

          -- Toggle last open buffer
          ["<Leader><tab>"] = { "<cmd>b#<cr>", desc = "Previous tab" },

          -- snaps file explorer
          ["<Leader>E"] = { "<cmd>lua Snacks.picker.explorer()<cr>", desc = "Snacks Explorer" },

          -- Save prompting for file name
          ["<Leader>W"] = { ":write ", desc = "Save as file" },

          -- Show dashboard when last buffer is closed
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if not bufs[2] then require("snacks").dashboard() end
            end,
            desc = "Close buffer",
          },

          -- Toggle between src and test
          ["<localLeader>ts"] = { "<cmd>Other<cr>", desc = "Switch between src and test" },
          -- Find Menu
          -- browse via directory structure, create and modify paths
          -- ["<Leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "Explorer" },
          -- find word for specific file patterns
          -- ["<Leader>fg"] = {
          --   "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
          --   desc = "Grep Word",
          -- },
        },
        t = {
          -- terminal mode key bindings
        },
        v = {
          -- visual mode key bindings
        },
      },
    },
  },
}
