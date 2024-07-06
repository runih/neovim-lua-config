return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    -- Make sure the the debuggers are installed
    -- go: 'go install github.com/go-delve/delve/cmd/dlv@latest'
    -- python: 'pip install debugpy'

    local MASON_BIN_PATH = os.getenv('HOME') .. '/.local/share/nvim/mason/bin'
    local MASON_PACKAGE_PATH = os.getenv('HOME')
      .. '/.local/share/nvim/mason/packages'

    -- loading plugins
    local dap_loaded, dap = pcall(require, 'dap')
    local dapui_loaded, dapui = pcall(require, 'dapui')

    if dap_loaded and dapui_loaded then
      dap.adapters.python = {
        type = 'executable',
        command = MASON_BIN_PATH .. '/debugpy-adapter',
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          args = function()
            local s = vim.fn.input('Enter arguments: ')
            local args = {}
            for arg in string.gmatch(s, '[a-zA-Z,-]+') do
              table.insert(args, arg)
            end
            return args
          end,
          pythonPath = function()
            return 'python'
          end,
        },
      }

      dap.adapters.coreclr = {
        type = 'executable',
        command = MASON_BIN_PATH .. '/netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input(
              'Select the dll to debug'
                .. vim.fn.getcwd()
                .. '/bin/Debug/'
                .. 'file'
            )
          end,
        },
      }
      local BASH_DEBUG_ADAPTER_BIN = MASON_BIN_PATH .. '/bash-debug-adapter'
      local BASHDB_DIR = MASON_PACKAGE_PATH
        .. '/bash-debug-adapter/extension/bashdb_dir'

      dap.adapters.sh = {
        type = 'executable',
        command = BASH_DEBUG_ADAPTER_BIN,
      }
      dap.configurations.sh = {
        {
          name = 'Launch Bash debugger',
          type = 'sh',
          request = 'launch',
          program = '${file}',
          cwd = '${fileDirname}',
          pathBashdb = BASHDB_DIR .. '/bashdb',
          pathBashdbLib = BASHDB_DIR,
          pathBash = 'bash',
          pathCat = 'cat',
          pathMkfifo = 'mkfifo',
          pathPkill = 'pkill',
          env = {},
          args = {},
          -- showDebugOutput = true,
          -- trace = true,
        },
      }

      dap.configurations.cpp = {
        {
          name = 'Launch file',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input(
              'Path to executable: ' .. vim.fn.getcwd() .. '/' .. 'file'
            )
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
        },
        {
          name = 'Attach to gdbserver:1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerSererAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input(
              'Path to executable: ' .. vim.fn.getcwd() .. '/' .. 'file'
            )
          end,
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  end,
}
