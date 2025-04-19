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

      local loaded, lspconfig = pcall(require, 'lspconfig')
      if not loaded then
        return
      end

      -- Set up the LSP servers
      local mason_lsp_loaded, mason_lspconfig =
        pcall(require, 'mason-lspconfig')
      if mason_lsp_loaded then
        local servers = mason_lspconfig.get_installed_servers()

        local settings = {
          -- YAML language server with Kubernetes schema support
          yamlls = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = '*.k8s.yaml', -- Restrict schema to Kubernetes-specific files
                },
              },
            },
          },
        }

        for _, server in ipairs(servers) do
          local config = {
            capabilities = capabilities,
          }
          if settings[server] then
            config.settings = settings[server].settings
          end
          lspconfig[server].setup(config)
        end
      end
    end,
  },
}
