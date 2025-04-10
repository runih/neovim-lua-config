-- Define the path to the lazy.nvim plugin
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Check if the lazy.nvim plugin is not installed
if not vim.loop.fs_stat(lazypath) then
  -- Clone the lazy.nvim repository from GitHub
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none', -- Only clone essential files
    'https://github.com/folke/lazy.nvim.git', -- Repository URL
    '--branch=stable', -- Use the latest stable release
    lazypath, -- Destination path
  })
end

-- Prepend the lazy.nvim path to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Set global leader keys
vim.g.mapleader = ' ' -- Space as the leader key
vim.g.maplocalleader = ' ' -- Space as the local leader key

-- Attempt to load the lazy.nvim plugin
local lazy_loaded, lazy = pcall(require, 'lazy')
if lazy_loaded then
  -- Configure lazy.nvim with plugin imports and settings
  lazy.setup({
    { import = 'plugins' }, -- Import general plugins
    { import = 'plugins.ai' }, -- Import AI-related plugins
    { import = 'plugins.git' }, -- Import Git-related plugins
    { import = 'plugins.lsp' }, -- Import LSP-related plugins
    { import = 'plugins.debugging' }, -- Import debugging plugins
  }, {
    dev = {
      path = '~/Projects/neovim-plugins', -- Path for local plugin development
      fallback = true, -- Use fallback if the path is unavailable
    },
    checker = {
      enabled = true, -- Enable plugin update checker
      notify = false, -- Disable notifications for updates
    },
  })

  -- Check for the existence of a local setup file
  local config_path = vim.fn.stdpath('config') .. '/lua/local/setup.lua'
  if vim.fn.filereadable(config_path) == 1 then
    local ok, err = pcall(require, 'local.setup')
    if not ok then
      vim.notify(
        'Failed to load local setup file: ' .. err,
        vim.log.levels.WARN
      )
    end
  end
end

-- Keymappings
if lazy_loaded then
  vim.keymap.set(
    'n',
    '<leader>L',
    '<cmd>Lazy<CR>',
    { desc = 'Open Lazy.nvim plugin manager' }
  )
end
