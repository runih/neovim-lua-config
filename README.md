# NeoVim configuration using Lua only

This is my NeoVim configuration. This configuration needs NeoVim v0.8 or higher!

# Overwrite configuration

It is possible to overwrite the configuration. All files located in `lua/local` will be ignored by git.

To Change the guifont for NeoVide for only your computer you can add the following to `lua/local`:

```lua
-- File: lua/local/init.lua
local config = {
  setup = function()
    local opt = vim.opt

    -- NeoVide overwrite configuration
    if vim.g.neovide then
      opt.guifont = { 'VictorMono_Nerd_Font:h17' }
    end
  end,
}

return config
```

# Default colorscheme

Set the default colorscheme by running the command:

    echo "nightfox" > ~/.config/nvim/colorscheme

# A good guide on how to setup NeoVim

My configuration is inspired by [Josean Martinez](https://github.com/josean-dev/dev-environment-files) guide.

You can find the guide [here](https://www.youtube.com/watch?v=vdn_pKJUda8)
