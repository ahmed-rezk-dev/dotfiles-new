local plugins = {
  -- Helpers
  { "nvim-lua/plenary.nvim" }, -- require for LSP
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins._project").setup()
    end,
  }, -- Automagically cd to project directory using nvim lsp
  { "lewis6991/impatient.nvim" }, -- Speed up loading Lua modules in Neovim to improve startup time.
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  -- sessions manager
  {
    "rmagatti/auto-session",
    config = function()
      require("plugins._sessions").setup()
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup()
    end,
  }, -- telescope sessions manager
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins._toggleterm").setup()
    end,
  }, -- To persist and toggle multiple terminals
  {
    "christianchiarulli/nvim-gps",
    branch = "text_hl",
    config = function()
      require("plugins._gps").setup()
    end,
  }, -- nvim-gps is status line component that shows context of the current cursor position in file
  {
    "jbyuki/instant.nvim",
    config = function()
      require("plugins._instant").setup()
    end,
  }, -- instant.nvim is a collaborative editing plugin for Neovim written in Lua with no dependencies.

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "joechrisellis/lsp-format-modifications.nvim" },
  {
    "folke/trouble.nvim",
    config = function()
      require("plugins._trouble").setup()
    end,
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  --[[   {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', config = function() require('plugins._fold').setup() end } ]]
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup()
    end,
  },

  --[[   {"neomake/neomake", config = function()  vim.g.gneomake_typescriptreact_enabled_makers = "['tsc']" end} ]]
  --[[ { ]]
  --[[   "rcarriga/nvim-notify", ]]
  --[[   config = function() ]]
  --[[     require("plugins._notify").setup() ]]
  --[[   end, ]]
  --[[   lazy = true, ]]
  --[[ }, ]]

  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("plugins._tsc").setup()
    end,
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugins._signature").setup()
    end,
  },
  { "MunifTanjim/nui.nvim" },

  -- Treesitter
  -- parser generator language syntax
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins._treesitter").setup()
    end,
  },
  { "nvim-treesitter/playground" }, -- Neovim Treesitter Playground
  { "mrjones2014/nvim-ts-rainbow" },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins._indentline").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins._comment").setup()
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins._autopairs").setup()
    end,
  },
  { "windwp/nvim-ts-autotag" },
  -- To supports multiple characters auto close & open tags
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins._colorizer").setup()
    end,
  }, -- A high-performance color highlighter
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins._todo-higlight").setup()
    end,
  }, -- highlight your todo comments in different styles
  {
    "folke/noice.nvim",
    config = function()
      require("plugins._noice").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      --[[ "rcarriga/nvim-notify", ]]
    },
  }, -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

  -- cmp plugins
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins._cmp").setup()
    end,
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  {
    "tzachar/cmp-tabnine",
    build = vim.fn.stdpath "data" .. "/lazy/cmp-tabnine/install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("plugins._tabnine").setup()
    end,
  },
  { "onsails/lspkind.nvim" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      { "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
      {
        "microsoft/vscode-js-debug",
        --[[ build = "npm install --legacy-peer-deps && npm run compile", ]]
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    lazy = true,
    config = function()
      require("lsp.dap.setup").setup()
    end,
    disable = false,
  },

  --[[ { "rcarriga/nvim-dap-ui" }, ]]
  --[[ { "nvim-telescope/telescope-dap.nvim" }, ]]
  --[[ { "Pocco81/DAPInstall.nvim", commit = "24923c3819a450a772bb8f675926d530e829665f" }, ]]
  --[[ { "theHamsta/nvim-dap-virtual-text" }, ]]

  -- Lua interface plugins
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins._nvim-tree").setup()
    end,
  }, -- Files exploer
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins._whichkey").setup()
    end,
  }, -- shortcuts manager
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins._bufferline").setup()
    end,
  }, -- Tabs/Buffers mananger
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins._lualine").setup()
    end,
  }, -- Stauts button bar
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins._telescope").setup()
    end,
  }, -- finder/ Searchings
  -- Dashboard window
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugins._dashboard").setup()
    end,
  },

  --[[ Smart split ]]
  --[[ { ]]
  --[[   "beauwilliams/focus.nvim", ]]
  --[[   config = function() ]]
  --[[     require("focus").setup { width = 200 } ]]
  --[[   end, ]]
  --[[ }, ]]

  --[[ { ]]
  --[[   "goolord/alpha-nvim", ]]
  --[[   config = function() ]]
  --[[     require("plugins._alpha").setup() ]]
  --[[   end, ]]
  --[[ }, ]]
  -- This is the Neovim implementation of the famous Emacs Hydra package.
  {
    "anuvyklack/hydra.nvim",
    config = function()
      require("plugins._hydra").setup()
    end,
  },
  { "nvim-tree/nvim-web-devicons" }, -- This plugin provides the same icons as well as colors for each icon
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugins._lspsaga").setup()
    end,
  }, -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
  {
    "chentoast/marks.nvim",
    config = function()
      require("plugins._marker").setup()
    end,
  }, -- A better user experience for interacting with and manipulating Vim marks.
  {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      require("plugins._hop").setup()
    end,
  }, -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document.
  {
    "windwp/nvim-spectre",
    config = function()
      require("plugins._spectre").setup()
    end,
  }, -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document.
  { "ibhagwan/fzf-lua" },

  --[[ -- Themes/Colorsches ]]
  { "siduck76/nvim-base16.lua" },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      --[[ require("themes.tokyonight").setup() ]]
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme kanagawa]])
    end,
  },
  --[[ { ]]
  --[[     "olimorris/onedarkpro.nvim", ]]
  --[[     config = function() ]]
  --[[         require("themes.onedarkPro").setup() ]]
  --[[     end, ]]
  --[[ }, ]]
  --[[   { "ahmed-rezk-dev/onedarkpro.nvim", config = function() require("themes.onedarkPro").setup() end } ]]
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins._dressing").setup()
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      --[[ require("themes.gruvbox").setup() ]]
    end,
  },
  -- extensible core UI hooks (vim.ui.select and vim.ui.input).
  -- My fave colour schemes:
  -- dracula/dracula-theme, rakr/vim-one, gosukiwi/vim-atom-dark,
  -- phanviet/vim-monokai-pro rhysd/vim-color-spring-night arzg/vim-colors-xcode
  -- kyoz/purify 'jonathanfilip/vim-lucius'

  --[[   {'catppuccin/nvim'} ]]
  --[[   {'Mofiqul/dracula.nvim'} ]]
  --[[   {'shaunsingh/nord.nvim'} ]]
  --[[   'navarasu/onedark.nvim' ]]

  --[[ { ]]
  --[[   "neanias/everforest-nvim", ]]
  --[[   version = false, ]]
  --[[   lazy = false, ]]
  --[[   priority = 1000, -- make sure to load this before all the other start plugins ]]
  --[[   -- Optional; default configuration will be used if setup isn't called. ]]
  --[[   config = function() ]]
  --[[     require("everforest").setup { background = "hard" } ]]
  --[[   end, ]]
  --[[ }, ]]
  --[[ { ]]
  --[[   "luisiacc/gruvbox-baby", ]]
  --[[   branch = "main", ]]
  --[[   config = function() ]]
  --[[     vim.g.gruvbox_baby_background_color = "dark" ]]
  --[[   end, ]]
  --[[ }, ]]
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "macchiato",
        },
      }
    end,
  },
  -- Customization

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins._git").gitsignsSetup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("plugins._git").diffviewSetup()
    end,
  },
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    config = function()
      require("plugins._git").neogitSetup()
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("plugins._octo").setup()
    end,
  }, -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
  -- Note taking
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    after = "nvim-treesitter",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins._norg").setup()
    end,
  },
  {
    "petertriho/cmp-git",
    config = function()
      require("plugins._git").cmpGitSetup()
    end,
  },
  {
    dir = "~/work/nvim/jira_ui.nvim",
    dev = true,
    setup = function()
      require("jira_ui").setup { name = "Alexander, The Great" }
    end,
  },
  --[[   {'akinsho/git-conflict.nvim', tag = "*", config = function() require('plugins._git').gitConflicts() end } -- visualise and resolve conflicts ]]
}
local opts = {}

require("lazy").setup(plugins, opts)
