local M = {}

M.nvim_tree = {
  git = {
    enable = true,
  },

  api = {
    -- 移除默认的按键映射，因为它们在浮动窗口中可能不适用
    disable_keymaps = true,
    -- 不要忽略 .gitignored 和自定义忽略的文件
    ignore_gitignore = false,
  },

  view = {
    -- 将浮动窗口的宽度设置为其内容的自适应宽度
    adaptive_size = true,
    -- 重要的部分：定义浮动窗口的样式
    float = {
      enable = true,
      open_win_config = {
        relative = "editor", -- 相对于整个编辑器窗口
        border = "rounded", -- 圆角边框
        width = 40, -- 初始宽度
        height = 30, -- 初始高度
        row = 1, -- 初始行位置
        col = 1, -- 初始列位置
      },
    },
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = { "\\.git", "\\.cache" },
  },
}

M.nightfox = {
  options = {
    transparent = true,
    terminal_colors = true,
    dim_inactive = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      functions = "bold",
      variables = "italic",
      types = "italic,bold",
    },
  },
}

M.smooth_cursor = {
  type = "default", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

  cursor = "➤", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
  texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
  linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

  autostart = true, -- Automatically start SmoothCursor
  always_redraw = true, -- Redraw the screen on each update
  flyin_effect = nil, -- Choose "bottom" or "top" for flying effect
  speed = 25, -- Max speed is 100 to stick with your current position
  intervals = 35, -- Update intervals in milliseconds
  priority = 10, -- Set marker priority
  timeout = 3000, -- Timeout for animations in milliseconds
  threshold = 3, -- Animate only if cursor moves more than this many lines
  max_threshold = nil, -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
  disable_float_win = false, -- Disable in floating windows
  enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
  disabled_filetypes = nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
  -- Show the position of the latest input mode positions.
  -- A value of "enter" means the position will be updated when entering the mode.
  -- A value of "leave" means the position will be updated when leaving the mode.
  -- `nil` = disabled
  show_last_positions = nil,
}

M.modes = {
  colors = {
    bg = "", -- Optional bg param, defaults to Normal hl group
    copy = "#f5c359",
    delete = "#c75c6a",
    change = "#c75c6a", -- Optional param, defaults to delete
    format = "#c79585",
    insert = "#78ccc5",
    replace = "#245361",
    select = "#9745be", -- Optional param, defaults to visual
    visual = "#9745be",
  },

  -- Set opacity for cursorline and number background
  line_opacity = 0.15,

  -- Enable cursor highlights
  set_cursor = true,

  -- Enable cursorline initially, and disable cursorline for inactive windows
  -- or ignored filetypes
  set_cursorline = true,

  -- Enable line number highlights to match cursorline
  set_number = true,

  -- Enable sign column highlights to match cursorline
  set_signcolumn = true,

  set_mode_enable = true,

  -- Disable modes highlights for specified filetypes
  -- or enable with prefix "!" if otherwise disabled (please PR common patterns)
  -- Can also be a function fun():boolean that disables modes highlights when true
  ignore = { "NvimTree", "TelescopePrompt", "!minifiles" },
}

return M
