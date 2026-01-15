return {
  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = require("configs.tools").gitsigns,
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    opts = require("configs.tools").vimtex,
  },

  {
    "neoclide/coc.nvim",
    lazy = true,
    branch = "release",
  },
}
