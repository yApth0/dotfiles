vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set({'n', 'v', 'i'}, '<F11>', '<cmd>Cpp<cr>')
vim.keymap.set({'n', 'v', 'i'}, '<F12>', '<cmd>Run<cr>a')
vim.keymap.set({'n', 'v', 'i'}, '<C-=>', function()
    change_scale_factor(1.25);
end)
vim.keymap.set({'n', 'v', 'i'}, '<C-->', function()
    change_scale_factor(4/5.0);
end)
