local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
  keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "ed", "<cmd>Telescope diagnostics<CR>", opts)
  keymap.set("n", "ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "en", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", "<cmd>TypescriptRenameFile<CR>")
  end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom setting for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  }
})

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

