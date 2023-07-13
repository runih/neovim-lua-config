-- local border = {
--   { "╭", "LspFloatWinBorder" },
--   { "─", "LspFloatWinBorder" },
--   { "╮", "LspFloatWinBorder" },
--   { "│", "LspFloatWinBorder" },
--   { "╯", "LspFloatWinBorder" },
--   { "─", "LspFloatWinBorder" },
--   { "╰", "LspFloatWinBorder" },
--   { "│", "LspFloatWinBorder" },
-- }
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = border, --“rounded”,
-- })
-- 
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {

  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    local ok, noice = pcall(require, 'noice')
    if not ok then
      print("Noice did not load!")
      return
    end

    noice.setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enable an input dialog for inc-rename.nvim
        lsp_doc_boarder = false, -- add a border to hover docs and signature help
      }
    })
  end
}
