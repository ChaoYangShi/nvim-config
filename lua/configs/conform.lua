local conform = require "conform"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format", lsp_format = "last" },
    python = function(bufnr)
      if conform.get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
     timeout_ms = 2000,
     lsp_fallback = true,
   },
}

return options
