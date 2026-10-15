require "nvchad.options"

local config = require("my_config")

local o = vim.o
o.relativenumber = true
o.tabstop = config.tabspace
o.shiftwidth = config.tabspace
o.expandtab = true
o.softtabstop = config.tabspace
o.guifont = config.gui_font

-- o.shell = "bash.exe"
-- o.cursorlineopt ='both' -- to enable cursorline!
