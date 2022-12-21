-- Make sure the the debuggers are installed
-- go: 'go install github.com/go-delve/delve/cmd/dlv@latest'
-- python: 'pip install debugpy'

local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
  return
end

local dapui_setup, dapui = pcall(require, "dapui")
if not dapui_setup then
  return
end

local dap_virtual_text_setup, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_setup then
  print("Did not load dap-virtual-text")
  return
end

local dapgo_status, dapgo = pcall(require, "dap-go")
if not dapgo_status then
  return
end

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return 'python'
    end;
  },
}

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function ()
      return vim.fn.input('Select the dll to debug', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

dapui.setup()

dap_virtual_text.setup()

dapgo.setup()

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
end
