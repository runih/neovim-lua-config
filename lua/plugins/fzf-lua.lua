return {
  'ibhagwan/fzf-lua',
  enabled = true,
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.85,
      row = 0.5,
      col = 0.5,
      border = 'rounded',
      preview = {
        default = 'bat',
        wrap = 'wrap',
        hidden = 'nohidden',
        delay = 100,
        vertical = 'up:30%',
        horizontal = 'right:50%',
        layout = 'horizontal',
        border = 'rounded',
      },
    },
    fzf_opts = {
      ['--ansi'] = '',
      ['--info'] = 'inline',
      ['--height'] = '100%',
      ['--layout'] = 'reverse',
    },
    files = {
      git_icons_enabled = true,
    },
  },
  keys = {
    { '<leader>f.', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>fB', '<cmd>FzfLua builtin<cr>', desc = 'Builtin' },

    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Files' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', desc = 'Oldfiles' },
    { '<leader>ft', '<cmd>FzfLua filetypes<cr>', desc = 'Filetypes' },
    -- Buffer related
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
    { '<leader>fbd', '<cmd>FzfLua buffers delete<cr>', desc = 'Delete Buffer' },
    { '<leader>fbo', '<cmd>FzfLua buffers oldfiles<cr>', desc = 'Old Buffers' },
    { '<leader>fbl', '<cmd>FzfLua blines<cr>', desc = 'Buffer Lines' },
    { '<leader>fbt', '<cmd>FzfLua btags<cr>', desc = 'Buffer Tags' },
    --{ '<leader>fT', '<cmd>FzfLua tabs<cr>', desc = 'Tabs' },
    -- Search Related
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = 'Grep Cword' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', desc = 'Grep CWORD' },
    { '<leader>fS', '<cmd>FzfLua grep_curbuf<cr>', desc = 'Grep Curbuf' },
    { '<leader>fr', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    -- Get Related
    { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Git Files' },
    { '<leader>fG', '<cmd>FzfLua git_status<cr>', desc = 'Git Status' },
    { '<leader>fP', '<cmd>FzfLua git_stash<cr>', desc = 'Git Stash' },
    { '<leader>fC', '<cmd>FzfLua git_commits<cr>', desc = 'Git Commits' },
    -- LSP related
    {
      '<leader>fD',
      '<cmd>FzfLua lsp_definitions<cr>',
      desc = 'LSP Definitions',
    },
    {
      '<leader>fI',
      '<cmd>FzfLua lsp_implementations<cr>',
      desc = 'LSP Implementations',
    },
    { '<leader>fR', '<cmd>FzfLua lsp_references<cr>', desc = 'LSP References' },
    {
      '<leader>fS',
      '<cmd>FzfLua lsp_document_symbols<cr>',
      desc = 'LSP Document Symbols',
    },
    {
      '<leader>flt',
      '<cmd>FzfLua lsp_type_definitions<cr>',
      desc = 'LSP Type Definitions',
    },
    {
      '<leader>fa',
      '<cmd>FzfLua lsp_code_actions<cr>',
      desc = 'LSP Code Actions',
    },
    {
      '<leader>fd',
      '<cmd>FzfLua diagnostics_document<cr>',
      desc = 'Diagnostics Document',
    },
    {
      '<leader>fQ',
      '<cmd>FzfLua diagnostics_workspace<cr>',
      desc = 'Diagnostics Workspace',
    },
    -- Other commands
    { '<leader>fk', '<cmd>FzfLua keymaps<cr>', desc = 'Keymapping' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Tags' },
    { '<leader>fM', '<cmd>FzfLua man_pages<cr>', desc = 'Man pages' },
    { '<leader>f<space>', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
    { '<leader>fT', '<cmd>FzfLua tags<cr>', desc = 'Tags' },
    { '<leader>f=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spell Suggest' },
  },
}
