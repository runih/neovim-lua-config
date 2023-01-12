return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status update for LSP
    'j-hui/fidget.nvim',

    -- Additional lua configuration, makes nvim stuff amazing
    'folke/neodev.nvim',
    {
      'glepnir/lspsaga.nvim',
      branch = 'main'
    },

    -- configureing lsp servers
    'jose-elias-alvarez/typescript.nvim',
    'onsails/lspkind.nvim',
  },
  config = function()
    local mason_ok, mason = pcall(require, "mason")
    if not mason_ok then
      return
    end

    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_ok then
      return
    end

    local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
    if not mason_null_ls_ok then
      return
    end

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "sumneko_lua",
        "pyright",
        "gopls"
      }
    })

    mason_null_ls.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
        "pylint",
        "yamlfmt",
        "golangci-lint"
      }
    })

    local saga_ok, saga = pcall(require, "lspsaga")
    if not saga_ok then
      return
    end

    saga.init_lsp_saga({
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },
      finder_action_keys = {
        open = "<CR>",
      },
      definition_action_keys = {
        edit = "<CR>",
      }
    })

    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
      return
    end

    local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_ok then
      return
    end

    local typescript_ok, typescript = pcall(require, "typescript")
    if not typescript_ok then
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

end
}
