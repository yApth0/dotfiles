vim.api.nvim_create_user_command("Cpp", function()
    if vim.fn.expand("%:e") ~= "cpp" then
      return
    end

    vim.cmd("cd %:h")
    vim.cmd("compiler gcc")
    vim.bo.makeprg = "g++ -std=c++26 -Wall -Wextra -Wpedantic -Werror -ggdb % -o %<"
    vim.cmd("make")
    vim.cmd("copen")
end, {nargs=0})

vim.api.nvim_create_user_command("Run", function()
    if vim.fn.expand("%:e") ~= "cpp" then
      return
    end

    vim.cmd("cd %:h")
    vim.cmd("split | term %<.exe")
end, {nargs=0})
