return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- Add necessary configuration options here
      -- Example: max_tokens = 1000, temperature = 0.7
    },
    keys = {
      {
        "<C-'>",
        '<cmd>CopilotChatInline<CR>',
        mode = 'i',
        desc = 'Trigger CopilotChat inline suggestions',
      },
      {
        '<C-Space>',
        '<cmd>CopilotChatAccept<CR>',
        mode = 'i',
        desc = 'Accept CopilotChat suggestion',
      },
      {
        '<leader>zc',
        '<cmd>CopilotChat<CR>',
        mode = 'n',
        desc = 'Chat with Copilot',
      },
      {
        '<leader>zr',
        '<cmd>CopilotChatReview<CR>',
        mode = 'v',
        desc = 'Review Code',
      },
      {
        '<leader>ze',
        '<cmd>CopilotChatExplain<CR>',
        mode = 'v',
        desc = 'Explain selected text with CopilotChat',
      },
      {
        '<leader>zf',
        '<cmd>CopilotChatFix<CR>',
        mode = 'v',
        desc = 'Fix Code Issues',
      },
      {
        '<leader>zo',
        '<cmd>CopilotChatOptimize<CR>',
        mode = 'v',
        desc = 'Optimize Code',
      },
      {
        '<leader>zd',
        '<cmd>CopilotChatDocs<CR>',
        mode = 'v',
        desc = 'Generate Documentation',
      },
      {
        '<leader>zt',
        '<cmd>CopilotChatTests<CR>',
        mode = 'v',
        desc = 'Generate Tests',
      },
      {
        '<leader>zq',
        '<cmd>CopilotChatClose<CR>',
        mode = 'n',
        desc = 'Close CopilotChat panel',
      },
      {
        '<leader>zg',
        '<cmd>CopilotChatGenerate<CR>',
        mode = 'v',
        desc = 'Generate code from selected text',
      },
      {
        '<leader>zm',
        '<cmd>CopilotChatCommit<CR>',
        mode = 'n',
        desc = 'Generate commit message',
      },
      {
        '<leader>zs',
        '<cmd>CopilotChatCommit<CR>',
        mode = 'v',
        desc = 'Generate commit for selected text',
      },
    },
  },
}
