require("nvchad.configs.lspconfig").defaults()

vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--clang-tidy",
  },
  init_options = {
    fallbackFlags = {"-std=c++26"}
  },
  root_markers = { '.clang-format', 'compile_commands.json' },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        }
      }
    }
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end,
})

local servers = { "html", "cssls", "clangd", "lua_ls", "neocmake" }
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
