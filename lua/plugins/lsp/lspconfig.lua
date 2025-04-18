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

      local language_servers = {
        -- Lua language server for Lua development
        { name = 'lua-language-server', lspname = 'lua_ls' },
        -- Bash language server for shell scripting
        { name = 'bash-language-server', lspname = 'bashls' },
        -- Dockerfile language server for Dockerfile syntax
        { name = 'dockerfile-language-server', lspname = 'dockerls' },
        -- Docker Compose language service for docker-compose files
        {
          name = 'docker-compose-language-service',
          lspname = 'docker_compose_language_service',
        },
        -- YAML language server with Kubernetes schema support
        {
          name = 'yaml-language-server',
          lspname = 'yamlls',
          settings = {
            yaml = {
              schemas = {
                kubernetes = '*.k8s.yaml', -- Restrict schema to Kubernetes-specific files
              },
            },
          },
        },
        -- Python LSP server for Python development
        { name = 'python-lsp-server', lspname = 'pylsp' },
        -- Vue language server for Vue.js development
        { name = 'vue-language-server', lspname = 'volar' },
        -- TypeScript language server for TypeScript/JavaScript
        { name = 'typescript-language-server', lspname = 'ts_ls' },
        -- Go language server for Go development
        { name = 'gopls', lspname = 'gopls' },
        -- Rust analyzer for Rust development
        { name = 'rust-analyzer', lspname = 'rust_analyzer' },
        -- Nil language server for Nix development
        { name = 'nil', lspname = 'nil_ls' },
        -- Java language server for Java development
        { name = 'jdtls', lspname = 'jdtls' },
      }

      for _, server in ipairs(language_servers) do
        if mason_registry.is_installed(server.name) then
          local config = {
            capabilities = capabilities,
          }
          if server.settings then
            config.settings = server.settings -- Include server-specific settings if defined
          end
          if lspconfig[server.lspname] then
            lspconfig[server.lspname].setup(config)
          else
            vim.notify(
              string.format(
                "LSP server '%s' is not registered in lspconfig.",
                server.lspname
              ),
              vim.log.levels.WARN
            )
          end
        end
      end
    end,
  },
}
