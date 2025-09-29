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
      -- Attempt to load the Blink completion plugin
      local blink_loaded, blink = pcall(require, 'blink.cmp')
      if not blink_loaded then
        print('blink not loaded') -- Notify if Blink is not available
        return
      end
      local capabilities = blink.get_lsp_capabilities() -- Get LSP capabilities from Blink

      -- Set up the LSP servers
      local mason_lsp_loaded, mason_lspconfig =
        pcall(require, 'mason-lspconfig')
      if mason_lsp_loaded then
        -- Get the list of installed LSP servers from Mason
        local servers = mason_lspconfig.get_installed_servers()

        -- Define server-specific settings
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

        -- Configure each installed server
        for _, server in ipairs(servers) do
          local config = {
            capabilities = capabilities, -- Include Blink capabilities
          }
          if settings[server] then
            config.settings = settings[server].settings -- Apply server-specific settings
          end
        end
      end
    end,
  },
}
