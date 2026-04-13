vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = false
    vim.bo.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.hl.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})
