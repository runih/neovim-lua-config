local builtin_loaded, builtin = pcall(require, "telescope.builtin")
if not builtin_loaded then
  return
end

local utils_loaded, utils = pcall(require, "telescope.utils")
if not utils_loaded then
  return
end

local dap_loaded, dap = pcall(require, "dap")
if not dap_loaded then
  return
end

local neotree_loaded, neotree  = pcall(require, "neo-tree.command")
if not neotree_loaded then
  return
end

local function get_file_name(file)
  return file:match("^.+/(.+)$")
end

local functions = {
  current_buffer_id = function ()
    print("Current Buffer: " .. vim.api.nvim_get_current_buf())
  end,

  load_current_luafile = function ()
    local currentfile = vim.api.nvim_buf_get_name(0)
    local filetype = vim.bo.filetype

    print("Loaded " .. filetype .. " file " .. currentfile)
    if filetype == "lua" then
      if get_file_name(currentfile) == "keymaps.lua" then
        package.loaded["core.functions"] = nil
      end
      vim.cmd("luafile " .. currentfile)
    end
    if filetype == "vim" then
      vim.cmd("source " .. currentfile)
    end
  end,

  new_buffer = function ()
    vim.api.nvim_command("new")
  end,

  new_vertical_buffer = function ()
    vim.api.nvim_command("vnew")
  end,

  new_tab = function ()
    vim.api.nvim_command("tabnew")
  end,

  edit_in_tab = function ()
    vim.api.nvim_command("tab split")
  end,

  terminal = function ()
    vim.api.nvim_command("vsplit")
    vim.api.nvim_command("terminal")
  end,

  keymaps = function ()
    local theme = require("telescope.themes").get_dropdown({
      previewer = false,
      prompt_prefix = 'Search> ',
      winblend=10,
      layout_config = {
        width = 0.9
      }
    })
    builtin.keymaps(theme)
  end,

  colorscheme = function ()
    local theme = require("telescope.themes").get_dropdown({
      previewer = false,
      prompt_prefix = '> ',
      winblend=10,
      --layout_config = {
      --  width = 0.9
      --}
    })
    builtin.colorscheme(theme)
  end,

  find_in_current_buff = function ()
    -- search in current buffer
    local theme = require("telescope.themes").get_dropdown({
      previewer = false,
      prompt_prefix = 'Search> ',
      winblend=10
    })
    builtin.current_buffer_fuzzy_find(theme)
  end,

  command_history = function ()
    local theme = require("telescope.themes").get_dropdown({
      previewer = false,
      prompt_prefix = 'Command : ',
      winblend=10
    })
    builtin.command_history(theme)
  end,

  nvim_config = function ()
    -- List nvim config files
    builtin.git_files({
      cwd="~/.config/nvim",
      prompt_title = 'NeoVim config',
      prompt_prefix = ' > ',
    })
  end,

  breakpoint_with_condition = function ()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end,

  breakpoint_based_on_log_point_message = function ()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end,

  open_neotree = function ()
    neotree.execute({
      reveal=true
    })
  end,

  project_files = function ()
    local _, ret, stderr = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    local gopts = {}
    gopts.prompt_title = 'Git files'
    gopts.prompt_prefix = ' > '
    if ret == 0 then
      builtin.git_files(gopts)
    else
      builtin.find_files()
    end
  end

}

return functions
