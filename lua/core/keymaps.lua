-- Loading my functions
local myfunctions_loaded, myfunctions = pcall(require, 'core.functions')
if not myfunctions_loaded then
  print('My functions not loaded!')
  return
end

local keymap = vim.keymap -- for conciseness

local colorscheme_loaded, colorscheme = pcall(require, 'colorscheme-picker')
if colorscheme_loaded then
  keymap.set(
    'n',
    '<leader>bt',
    colorscheme.toggle_background,
    { desc = '[B]ackground [T]toggle' }
  )
end

-- general keymaps

keymap.set('t', '<C-W><C-N>', '<C-\\><C-N>', { remap = true }) -- Map <ctrl w>+<ctrl n> to exit terminal mode
keymap.set('i', 'jk', '<ESC>')
keymap.set('n', '<leader>nh', ':nohl<CR>')
-- I don't know what this does!
-- keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
-- keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

-- mine preferences
keymap.set('n', '<leader>cd', '<cmd>lcd %:h<CR>')
keymap.set(
  'n',
  '<leader>so',
  myfunctions.load_current_luafile,
  { desc = 'Loading current lua file' }
)
keymap.set(
  'n',
  '<leader>cb',
  myfunctions.current_buffer_id,
  { desc = '[C]urrent [B]uffer id' }
)
keymap.set(
  'n',
  '<leader>Bn',
  myfunctions.new_buffer,
  { desc = 'Create a new buffer below' }
)
keymap.set(
  'n',
  '<leader>Bv',
  myfunctions.new_vertical_buffer,
  { desc = 'Create a new buffer on the right side' }
)
keymap.set(
  'n',
  '<leader>tn',
  myfunctions.new_tab,
  { desc = 'Create a new Tab' }
)
keymap.set(
  'n',
  '<leader>te',
  myfunctions.edit_in_tab,
  { desc = 'Edit buffer en a new tab' }
)
keymap.set('n', '<leader><cr>', myfunctions.terminal, { desc = 'Terminal' })
keymap.set(
  'n',
  '<leader>W',
  '<cmd>w !sudo tee %<cr>',
  { desc = 'Do a sudo [W]rite' }
)
keymap.set(
  'n',
  '<leader>gp',
  myfunctions.project_files,
  { desc = '[P]roject Files' }
)

-- Snippet
keymap.set('i', '<C-Tab>', '<Plug>luasnip-jump-next')
keymap.set('i', '<C-S-Tab>', '<Plug>luasnip-jump-prev')

local cmd_loaded, cmd = pcall(require, 'cmd')
if cmd_loaded then
  keymap.set(
    'n',
    '<leader>!',
    cmd.execute_current_line,
    { desc = 'Execute current line in to a buffer' }
  )
end
-- plugin keymaps

-- telescope

local telescope_tabs_loaded, telescope_tabs = pcall(require, 'telescope-tabs')
if telescope_tabs_loaded then
  keymap.set(
    'n',
    '<leader>tt',
    telescope_tabs.list_tabs,
    { desc = 'List [T]abs' }
  )
end

-- Markdown
keymap.set(
  'n',
  '<leader>P',
  '<Plug>MarkdownPreviewToggle',
  { desc = 'Markdown [P]review' }
)

-- JSON formatting
keymap.set(
  'n',
  '<leader>Fj',
  '<cmd>JSONFormatter<cr>',
  { desc = '[F]ormat [J]son' }
)

-- For Testing lua files
keymap.set(
  'n',
  '<leader>T',
  '<Plug>PlenaryTestFile',
  { desc = 'Plenary[T]estFile' }
)

-- Alpha
keymap.set('n', '<leader>a', '<cmd>Alpha<CR>', { desc = '[A]lpha' })

-- Mason
keymap.set('n', '<leader>M', '<cmd>Mason<CR>', { desc = '[M]ason' })

-- Lazy
keymap.set('n', '<leader>L', '<cmd>Lazy<CR>', { desc = '[L]azy' })

-- LazyGit
keymap.set('n', '<leader>gn', '<cmd>Neogit<CR>', { desc = 'NeoGit' })
keymap.set(
  'n',
  '<leader>gb',
  '<cmd>BlameToggle virtual<CR>',
  { desc = 'Git Blame' }
)

keymap.set('n', '<c-e>', myfunctions.open_neotree, { desc = 'Open N[E]oTree' })
