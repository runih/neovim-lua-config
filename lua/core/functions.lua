local builtin_loaded, builtin = pcall(require, "telescope.builtin")
if not builtin_loaded then
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

local function expand_cmd(cmd)
  for index, value in ipairs(cmd) do
    cmd[index] = vim.fn.expand(value)
  end
  return cmd
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

  execute_current_line = function ()
    local bufnr = vim.api.nvim_get_current_buf()

    if not ShellBuffers then
      ShellBuffers = {}
    end

    if not ShellBuffers[bufnr] then
      ShellBuffers[bufnr] = {
        output = vim.api.nvim_create_buf(true, false)
      }
    end

    if ShellBuffers[bufnr].output then
      ShellBuffers[bufnr].scriptwin = vim.api.nvim_get_current_win()
      local window_exists, _ = pcall(vim.api.nvim_win_get_config, ShellBuffers[bufnr].outputwin)
      if not window_exists then
        vim.cmd('split')
        ShellBuffers[bufnr].outputwin = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(ShellBuffers[bufnr].outputwin, ShellBuffers[bufnr].output)
        vim.api.nvim_set_current_win(ShellBuffers[bufnr].scriptwin)
      end

      local lineNum = vim.api.nvim_win_get_cursor(0)[1]
      local content = vim.api.nvim_buf_get_lines(bufnr, lineNum - 1, lineNum, false)
      local cmd = {}
      for str in string.gmatch(content[1], "%S+") do
        table.insert(cmd, str)
      end
      vim.api.nvim_buf_set_lines(ShellBuffers[bufnr].output, 0, -1, false, {""})
      cmd = expand_cmd(cmd)
      vim.fn.jobstart(cmd, {
        stdout_bufferd = true,
        on_stdout = function (index, data)
          if data then
            vim.api.nvim_buf_set_lines(ShellBuffers[bufnr].output, index - 1, index -1, false, data)
          end
        end,
        on_stderr = function (index, data)
          if data then
            vim.api.nvim_buf_set_lines(ShellBuffers[bufnr].output, index - 1, index - 1, false, data)
          end
        end
      })
    end
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
    builtin.find_files({cwd="~/.config/nvim"})
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
  end

}

return functions
