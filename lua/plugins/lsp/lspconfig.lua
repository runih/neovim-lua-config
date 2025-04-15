return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'saghen/blink.cmp',
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
    config = function()
      local blink_loaded, blink = pcall(require, 'blink.cmp')
      if not blink_loaded then
        print('blink not loaded')
        return
      end
      local capabilities = blink.get_lsp_capabilities()

      local mason_registry_loaded, mason_registry =
        pcall(require, 'mason-registry')
      if not mason_registry_loaded then
        print('mason_registry not loaded')
        return
      end

      local loaded, lspconfig = pcall(require, 'lspconfig')
      if not loaded then
        return
      end

      if mason_registry.is_installed('lua-language-server') then
        lspconfig.lua_ls.setup({ capabilities = capabilities })
      end
      if mason_registry.is_installed('bash-language-server') then
        lspconfig.bashls.setup({ capabilities = capabilities })
      end
      if mason_registry.is_installed('nil') then
        vim.lsp.enable('nil_ls')
        lspconfig.nil_ls.setup({
          capabilities = capabilities,
          settings = {
            ['nil'] = {
              format = {
                enable = true,
              },
            },
          },
        })
      end
      if mason_registry.is_installed('yaml-language-server') then
        lspconfig.yamlls.setup({
          capabilities = capabilities,
          settings = {
            yaml = {
              schemas = {
                kubernetes = '/*.yaml',
              },
            },
          },
        })
      end
      if mason_registry.is_installed('python-lsp-server') then
        lspconfig.pylsp.setup({ capabilities = capabilities })
      end
      if mason_registry.is_installed('vue-language-server') then
        lspconfig.volar.setup({ capabilities = capabilities })
      end
      if mason_registry.is_installed('typescript-language-server') then
        lspconfig.ts_ls.setup({ capabilities = capabilities })
      end
      if mason_registry.is_installed('gopls') then
        lspconfig.gopls.setup({
          capabilities = capabilities,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        })
      end
      if mason_registry.is_installed('rust-analyzer') then
        lspconfig.rust_analyzer.setup({
          capabilities = capabilities,
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'clippy',
              },
            },
          },
        })
      end
    end,
  },
}
