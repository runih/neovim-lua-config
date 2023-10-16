-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Location list" })
local border = {
  { "╭", "LspFloatWinBorder" },
  { "─", "LspFloatWinBorder" },
  { "╮", "LspFloatWinBorder" },
  { "│", "LspFloatWinBorder" },
  { "╯", "LspFloatWinBorder" },
  { "─", "LspFloatWinBorder" },
  { "╰", "LspFloatWinBorder" },
  { "│", "LspFloatWinBorder" },
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border, --"rounded",
})
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[G]oto [D]eclaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "[G]oto [D]efinition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[G]oto [D]efinition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[G]oto [I]mplementation" })
    vim.keymap.set("n", "<C-d>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type [D]efinition" })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[R]en[a]me" })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "[G]oto [R]eference" })
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "[F]ormat" })
  end,
})

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- local on_attach = function(client, bufnr)
--   -- keybind options
--   local opts = { noremap = true, silent = true, buffer = bufnr }
-- end

local handlers = {
  function(server_name) -- default handler (optional)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
--      on_attach = on_attach,
    })
  end,
  ["pyright"] = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local util = require("lspconfig/util")
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
--      on_attach = on_attach,
      root_dir = function(fname)
        return util.root_pattern(".git", ".pylintrc", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(
          fname
        ) or util.path.dirname(fname)
      end,
    })
  end,
  ["lua_ls"] = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
--      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}

return {
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  },
  opts = {
    -- ensure_installed = lsp_servers,
    automatic_installation = true,
    handlers = handlers,
  },
  config = function ()
    local mason_lsponfig_ok, mason_lsponfig = pcall(require, "mason-lspconfig")
    if not mason_lsponfig_ok then
      return
    end
    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
      return
    end
    mason_lsponfig.setup({
      ensure_installed = { "volar" }
    })
    mason_lsponfig.setup_handlers({
      function(server_name)
        local server_config = {}
        lspconfig[server_name].setup(server_config)
      end
    })
  end
}
