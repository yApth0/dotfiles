require "nvchad.autocmds"

vim.cmd [[
autocmd VimEnter * cd C:\Users\josaf\Documents\Cpp\code
]]

-- ATUALIZA O CWD COM O ARQUIVO NOVO
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
--       local path = vim.fn.expand("%:p:h")
--       local api = require("nvim-tree.api")
--       local core = require("nvim-tree.core")
--       vim.cmd("lcd " .. path)
--       if not string.find(path, core.get_cwd()) then
--         api.tree.change_root(path)
--       end
--     end
--   end,
-- })
