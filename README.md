# NeoVim configuration using Lua only

This is my NeoVim configuration. This configuration needs NeoVim v0.10 or higher! If you are unsure of your version, run `nvim --version` in your terminal.

# Overwrite configuration

It is possible to overwrite the configuration. All files located in `lua/local` will be ignored by git. Ensure you add `lua/local` to your `.gitignore` file to prevent accidental commits.

To change the `guifont` for NeoVide on your computer, you can add the following to `lua/local`. This customization is optional and only applies if you are using NeoVide:

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

Set the default colorscheme by running the command below. If the file does not exist, it will be created automatically:

    echo "nightfox" > ~/.config/nvim/colorscheme

# A good guide on how to setup NeoVim

My configuration is inspired by [Josean Martinez](https://github.com/josean-dev/dev-environment-files) guide, particularly in its modular structure and use of Lua for customization.

You can find the guide [here](https://www.youtube.com/watch?v=vdn_pKJUda8)
