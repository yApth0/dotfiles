require "nvchad.mappings"

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

local map = vim.keymap.set

map({'n', 'v', 'i'}, '<F11>', '<cmd>Compile<cr>')
map({'n', 'v', 'i'}, '<F12>', '<cmd>Run<cr>a')
map({'n', 'v', 'i'}, '<C-=>', function()
    change_scale_factor(1.25);
end)
map({'n', 'v', 'i'}, '<C-->', function()
    change_scale_factor(4/5.0);
end)
