local overrides = require("configs.overrides")

local plugins = {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- Lazy load when event occurs. Events are triggered
  --   -- as mentioned in:
  --   -- https://vi.stackexchange.com/a/4495/20389
  --   -- event = "InsertEnter",
  --   -- Enable startup by uncommenting above and commenting below:
  --   lazy = false,
  --   opts = overrides.copilot,
  -- },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "elkowar/yuck.vim",
    ft="yuck",
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.formatter"
    end
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    config = function()
      require "configs.aerial"
    end,
  }
}
return plugins
