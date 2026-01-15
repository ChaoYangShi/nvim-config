require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local gitsigns = require "gitsigns"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<D-s>", "<cmd> w <cr>", { desc = "file save" })
map({ "n", "i", "v" }, "<D-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<D-y>", "<cmd> redo <cr>", { desc = "history redo" })

map({ "n" }, "<D-/>", "gcc", { desc = "comment toggle", remap = true })
map({ "i" }, "<D-/>", "<ESC>gcc^i", { desc = "comment toggle", remap = true })
map({ "v" }, "<D-/>", "gc", { desc = "comment toggle", remap = true })

map({ "n", "i", "v" }, "D-f", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd "q!"
  else
    vim.cmd "Telescope current_buffer_fuzzy_find"
  end
end, { desc = "search search in current buffer" })

map({ "n", "i", "v" }, "<A-f>", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd "q!"
  else
    vim.cmd "Telescope live_grep"
  end
end, { desc = "search search across project" })

map({ "n", "i", "v", "t" }, "A-v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggle vertical term" })

map({ "n", "i", "v", "t" }, "A-h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggle horizontal term" })

map({ "n", "i", "v", "t" }, "A-i", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("n", "gb", "<D-o>", { desc = "jump jump back" })
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover" })
map("n", "gh", vim.diagnostic.open_float, { desc = "LSP show diagnostics" })
map({ "n", "i", "v" }, "<A-.>", vim.lsp.buf.code_action, { desc = "LSP code action" })
map({ "n", "i", "v" }, "<F2>", function()
  if vim.bo.filetype == "NvimTree" then
    require("nvim-tree.api").fs.rename()
  else
    require "nvchad.lsp.renamer"()
  end
end, { desc = "LSP rename" })

map("n", "gD", "<CMD>Glance definitions<CR>")
map("n", "gR", "<CMD>Glance references<CR>")
map("n", "gY", "<CMD>Glance type_definitions<CR>")
map("n", "gM", "<CMD>Glance implementations<CR>")

map({ "n" }, "<leader><F5>", vim.cmd.Undotreetoggle)

-- gitsigns
map("n", "<leader>hs", gitsigns.stage_hunk)
map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end, { desc = "blame this line" })

map("n", "<leader>hd", gitsigns.diffthis, { desc = "git diff this line" })

map("n", "<leader>hD", function()
  gitsigns.diffthis "~"
end, { desc = "git diff the file " })
