return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      css = { ' prettier' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      postgresql = { 'pg_format' },
      python = { 'isort', 'black' },
      typescript = { 'prettier' },
      yaml = { 'prettier' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
  keys = {
    {
      '<leader>mp',
      mode = { 'n', 'v' },
      function()
        require('conform').format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end,
      desc = 'Format file or range (in vusual mode)',
    },
  },
}
