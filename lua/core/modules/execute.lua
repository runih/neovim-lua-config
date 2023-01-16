local function expand_cmd(cmd)
  for index, value in ipairs(cmd) do
    cmd[index] = vim.fn.expand(value)
  end
  return cmd
end

return {
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

}
