-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set global leader keys
vim.g.mapleader = ' '      -- Space as the leader key
vim.g.maplocalleader = ' ' -- Space as the local leader key

-- Attempt to load the lazy.nvim plugin
local lazy_loaded, lazy = pcall(require, 'lazy')
if lazy_loaded then
  -- Configure lazy.nvim with plugin imports and settings
  lazy.setup({
    spec = {
      { import = 'plugins' },           -- Import general plugins
      { import = 'plugins.ai' },        -- Import AI-related plugins
      { import = 'plugins.git' },       -- Import Git-related plugins
      { import = 'plugins.lsp' },       -- Import LSP-related plugins
      { import = 'plugins.debugging' }, -- Import debugging plugins
    },
    checker = {
      enabled = true, -- Enable plugin update checker
      notify = false, -- Disable notifications for updates
    },
    ---@diagnostic disable-next-line: assign-type-mismatch
    dev = {
      path = '~/Projects/neovim-plugins', -- Path for local plugin development
      fallback = true,                    -- Use fallback if the path is unavailable
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
