local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazy_loaded, lazy = pcall(require, 'lazy')
if lazy_loaded then
  lazy.setup({
    { import = 'plugins' },
    { import = 'plugins.ai' },
    { import = 'plugins.git' },
    { import = 'plugins.lsp' },
    { import = 'plugins.debugging' },
  }, {
    dev = {
      path = '~/Projects/neovim-plugins',
      fallback = true,
    },
    checker = {
      enabled = true,
      notify = false,
    },
  })

  local config_file =
    io.open(vim.fn.stdpath('config') .. '/lua/local/setup.lua')

  if config_file then
    config_file:close()
    require('local.setup')
  end
end

-- Keymappings
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<CR>', { desc = '[L]azy' })
