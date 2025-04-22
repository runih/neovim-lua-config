local builtin_loaded, builtin = pcall(require, 'telescope.builtin')
if not builtin_loaded then
  return
end

local utils_loaded, utils = pcall(require, 'telescope.utils')
if not utils_loaded then
  return
end

local function get_file_name(file)
  return file:match('^.+/(.+)$')
end

local function git_folder()
  local _, ret, _ =
    utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  return ret == 0
end

local functions = {
  current_buffer_id = function()
    print('Current Buffer: ' .. vim.api.nvim_get_current_buf())
  end,

  load_current_luafile = function()
    local currentfile = vim.api.nvim_buf_get_name(0)
    local filetype = vim.bo.filetype

    print('Loaded ' .. filetype .. ' file ' .. currentfile)
    if filetype == 'lua' then
      if get_file_name(currentfile) == 'keymaps.lua' then
        package.loaded['core.functions'] = nil
      end
      vim.cmd('luafile ' .. currentfile)
    end
    if filetype == 'vim' then
      vim.cmd('source ' .. currentfile)
    end
  end,

  new_buffer = function()
    vim.api.nvim_command('new')
  end,

  new_vertical_buffer = function()
    vim.api.nvim_command('vnew')
  end,

  new_tab = function()
    vim.api.nvim_command('tabnew')
  end,

  edit_in_tab = function()
    vim.api.nvim_command('tab split')
  end,

  terminal = function()
    vim.api.nvim_command('vsplit')
    vim.api.nvim_command('terminal')
  end,

  keymaps = function()
    local theme = require('telescope.themes').get_dropdown({
      previewer = false,
      prompt_prefix = 'Search> ',
      winblend = 10,
      layout_config = {
        width = 0.6,
        height = 0.5,
      },
    })
    builtin.keymaps(theme)
  end,

  find_in_current_buff = function()
    -- search in current buffer
    local theme = require('telescope.themes').get_dropdown({
      previewer = false,
      prompt_prefix = 'Search> ',
      winblend = 10,
      layout_config = {
        width = 0.6,
        height = 0.5,
      },
    })
    builtin.current_buffer_fuzzy_find(theme)
  end,

  command_history = function()
    local theme = require('telescope.themes').get_dropdown({
      previewer = false,
      prompt_prefix = 'Command : ',
      winblend = 10,
    })
    builtin.command_history(theme)
  end,

  nvim_config = function()
    local config_path = vim.fn.expand('~/.config/nvim')
    if vim.fn.isdirectory(config_path .. '/.git') == 0 then
      builtin.find_files({
        cwd = vim.fn.expand('~/.config/nvim'),
        prompt_title = 'NeoVim config (not in git)',
        prompt_prefix = ' ⚠   > ',
        winblend = 10,
        sorting_strategy = 'ascending',
        follow = true,
        layout_config = {
          prompt_position = 'top',
          width = 0.6,
          height = 0.5,
        },
      })
    else
      builtin.git_files({
        cwd = vim.fn.expand('~/.config/nvim'),
        prompt_title = 'NeoVim config',
        prompt_prefix = '  > ',
        winblend = 10,
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
          width = 0.6,
          height = 0.5,
        },
      })
    end
  end,

  open_neotree = function()
    local neotree_loaded, neotree = pcall(require, 'neo-tree.command')
    if not neotree_loaded then
      return
    end

    vim.api.nvim_set_current_dir(vim.fn.expand('%:h'))
    local dir = vim.fn.expand('%:h')
    if git_folder() then
      local gitfolder, _, _ =
        utils.get_os_command_output({ 'git', 'rev-parse', '--show-toplevel' })
      if gitfolder then
        dir = gitfolder[1]
      end
    end
    neotree.execute({
      dir = dir,
      reveal = true,
    })
  end,

  project_files = function()
    local opts = {}
    opts.winblend = 10
    -- opts.sorting_strategy = 'ascending'
    -- opts.layout_config = {
    --   prompt_position = 'top'
    -- }
    if git_folder() then
      opts.prompt_title = 'Git files'
      opts.prompt_prefix = '   > '
      builtin.git_files(opts)
    else
      builtin.find_files(opts)
    end
  end,

  git_worktrees = function()
    local loaded, telescope = pcall(require, 'telescope')
    if loaded then
      telescope.extensions.git_worktree.git_worktrees()
    end
  end,
  create_git_worktree = function()
    local loaded, telescope = pcall(require, 'telescope')
    if loaded then
      telescope.extensions.git_worktree.create_git_worktree()
    end
  end,

  toggle_foldmethod = function()
    local foldmethod = vim.opt_local.foldmethod:get()
    if foldmethod == 'manual' then
      vim.opt_local.foldmethod = 'indent'
      print('Fold method set to indent')
    else
      vim.opt_local.foldmethod = 'manual'
      vim.cmd('normal! zR') -- Expand all folds
      print('Fold method set to manual')
    end
  end,
}

return functions
