require "nvchad.options"

-- add yours here!

local opt = vim.opt
opt.cursorlineopt ='both' -- to enable cursorline!
opt.relativenumber = true

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
