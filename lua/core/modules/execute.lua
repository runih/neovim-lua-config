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
      cmd = expand_cmd(cmd)
      local handle = io.popen(table.concat(cmd, " ") .. " 2>&1")
      if handle then
        local result = handle:read("*a")
        local linenr = 1
        for line in result:gmatch("([^\n]*)\n?") do
          if line and string.len(line) > 0 then
            if linenr == 1 then
              vim.api.nvim_buf_set_lines(ShellBuffers[bufnr].output, 0, -1, false, { line })
            else
              vim.api.nvim_buf_set_lines(ShellBuffers[bufnr].output, -1, -1, false, { line })
            end
            linenr = linenr + 1
          end
        end
        handle:close()
      end
    end
  end,

}
