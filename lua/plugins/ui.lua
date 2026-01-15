return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.ui").nvim_tree,
    dependencies = {
      {
        "JMarkin/nvim-tree.lua-float-preview",
        lazy = true,
        -- default
        opts = {
          -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
          toggled_on = true,
          -- wrap nvimtree commands
          wrap_nvimtree_commands = true,
          -- lines for scroll
          scroll_lines = 20,
          -- window config
          window = {
            style = "minimal",
            relative = "win",
            border = "rounded",
            wrap = false,
          },
          mapping = {
            -- scroll down float buffer
            down = { "<C-d>" },
            -- scroll up float buffer
            up = { "<C-e>", "<C-u>" },
            -- enable/disable float windows
            toggle = { "<C-x>" },
          },
          -- hooks if return false preview doesn't shown
          hooks = {
            pre_open = function(path)
              -- if file > 5 MB or not text -> not preview
              local size = require("float-preview.utils").get_size(path)
              if type(size) ~= "number" then
                return false
              end
              local is_text = require("float-preview.utils").is_text(path)
              return size < 5 and is_text
            end,
            post_open = function(bufnr)
              return true
            end,
          },
        },
      },
    },
  },

  { -- Breadcrumbs
    "Bekaboo/dropbar.nvim",
    lazy = false,
    -- Optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  {
    "typicode/bg.nvim",
    lazy = false,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    opts = require("configs.ui").nightfox,
  },

  {
    "gen740/SmoothCursor.nvim",
    lazy = false,
    opts = require("configs.ui").smooth_cursor,
  },

  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    lazy = false,
    opts = require("configs.ui").modes,
  },
}
