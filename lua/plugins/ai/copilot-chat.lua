return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    lazy = true,
    dependencies = {
      { 'github/copilot.vim' },                       -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',                          -- Only on MacOS or Linux
    opts = {
      -- Add necessary configuration options here
      -- Example: max_tokens = 1000, temperature = 0.7
    },
    init = function()
      -- Make sure the copilot chat window has markdown as the default filetype
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.filetype = 'markdown'
        end,
      })
    end,
    keys = {
      { "<C-'>",      mode = 'i', '<cmd>CopilotChatInline<CR>',   desc = 'Trigger CopilotChat inline suggestions', },
      { '<C-Space>',  mode = 'i', '<cmd>CopilotChatAccept<CR>',   desc = 'Accept CopilotChat suggestion', },
      { '<leader>zc', mode = 'n', '<cmd>CopilotChat<CR>',         desc = 'Chat with Copilot', },
      { '<leader>zr', mode = 'v', '<cmd>CopilotChatReview<CR>',   desc = 'Review Code', },
      { '<leader>ze', mode = 'v', '<cmd>CopilotChatExplain<CR>',  desc = 'Explain selected text with CopilotChat', },
      { '<leader>zf', mode = 'v', '<cmd>CopilotChatFix<CR>',      desc = 'Fix Code Issues', },
      { '<leader>zo', mode = 'v', '<cmd>CopilotChatOptimize<CR>', desc = 'Optimize Code', },
      { '<leader>zd', mode = 'v', '<cmd>CopilotChatDocs<CR>',     desc = 'Generate Documentation', },
      { '<leader>zt', mode = 'v', '<cmd>CopilotChatTests<CR>',    desc = 'Generate Tests', },
      { '<leader>zq', mode = 'n', '<cmd>CopilotChatClose<CR>',    desc = 'Close CopilotChat panel', },
      { '<leader>zg', mode = 'v', '<cmd>CopilotChatGenerate<CR>', desc = 'Generate code from selected text', },
      { '<leader>zm', mode = 'n', '<cmd>CopilotChatCommit<CR>',   desc = 'Generate commit message', },
      { '<leader>zs', mode = 'v', '<cmd>CopilotChatCommit<CR>',   desc = 'Generate commit for selected text', },
    },
  },
}
