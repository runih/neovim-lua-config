local keymap = vim.keymap
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = 'Show LSP References'
    keymap.set('n', 'gR', "<cmd>Telescope lsp_references<cr>", opts)

    opts.desc = 'Show LSP Definition'
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    opts.desc = 'See available LSP code actions'
    keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  end
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = " ",
      [severity.INFO] = " ",
    }
  }
})
