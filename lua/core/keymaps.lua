
local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("t", "<C-W><C-N>", "<C-\\><C-N>", {remap = true }) -- Map <ctrl w>+<ctrl n> to exit terminal mode

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- mine preferences
keymap.set("n", "<leader>so", "<cmd>source %<CR>")
keymap.set("n", "<leader>lo", "<cmd>luafile %<CR>")
keymap.set("n", "<leader>cd", "<cmd>lcd %:h<CR>")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

-- telescope
local builtin_loaded, builtin = pcall(require, "telescope.builtin")
if builtin_loaded then

  local find_in_current_buff = function ()
    -- search in current buffer
    local theme = require("telescope.themes").get_dropdown({
      previewer = false,
      prompt_prefix = 'Search> ',
      winblend=10
    })
    builtin.current_buffer_fuzzy_find(theme)
  end

  local nvim_config = function ()
    -- List nvim config files
    builtin.find_files({cwd="~/.config/nvim"})
  end

  keymap.set("n", "<leader>?",        builtin.oldfiles,                   { desc = "[?] Find recently opened files" })
  keymap.set("n", "<leader><space>",  builtin.buffers,                    { desc = "[ ] Find existing buffers" })
  keymap.set("n", "<leader>sf",       builtin.find_files,                 { desc = "[S]earch [F]iles" })
  keymap.set("n", "<leader>sgf",      builtin.git_files,                  { desc = "[S]earch [G]it [F]iles" })
  keymap.set("n", "<leader>sh",       builtin.help_tags,                  { desc = "[S]earch [H]elp" })
  keymap.set("n", "<leader>sw",       builtin.grep_string,                { desc = "[S]earch current [W]ord" })
  keymap.set("n", "<leader>sg",       builtin.live_grep,                  { desc = "[S]earch by [G]rep" })
  keymap.set("n", "<leader>sd",       builtin.diagnostics,                { desc = "[S]earch [D]iagnostics" })
  keymap.set("n", "<leader>km",       builtin.keymaps,                    { desc = "[K]ey[M]aps" })
  keymap.set("n", "<leader>st",       builtin.filetypes,                  { desc = "[S]search [T]ypes" })
  keymap.set("n", "|",                find_in_current_buff,               { desc = "[|] Search in current buffer" })
  keymap.set("n", "<leader>sn",       nvim_config,                        { desc = "[S]earch [N]eoVim configurations" })
end

local telescope_tabs_loaded, telescope_tabs = pcall(require, "telescope-tabs")
if telescope_tabs_loaded then
  keymap.set("n", "<C-S-T>", telescope_tabs.list_tabs,                    { desc = "[L]ist [T]abs" })
end

-- For Testing lua files
keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile", { desc = "Plenary[T]estFile" })

-- Alpha
keymap.set("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "[A]lpha" })

-- Mason
keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "[M]ason" })

-- Lazy
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy" })

-- LazyGit
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- debugging
local dap_loaded, dap = pcall(require, "dap")
if dap_loaded then

  local breakpoint_with_condition = function ()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end

  local breakpoint_based_on_log_point_message = function ()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end

  keymap.set("n", "<F2>",         dap.continue,                                 { desc = "[F2] Debug continue" })
  keymap.set("n", "<F3>",         dap.step_into,                                { desc = "[F3] Debug Step Into" })
  keymap.set("n", "<F4>",         dap.step_over,                                { desc = "[F4] Debug Stop Over" })
  keymap.set("n", "<F5>",         dap.step_out,                                 { desc = "[F5] Debug Stop Out" })
  keymap.set("n", "<leader>b",    dap.toggle_breakpoint,                        { desc = "Toggle [b]reakpoint" })
  keymap.set("n", "<leader>B",    breakpoint_with_condition,                    { desc = "Toggle [B]reakpoint with condition"})
  keymap.set("n", "<leader>lp",   breakpoint_based_on_log_point_message,        { desc = "Toggle breakpoint based on [l]og [p]oint message" })
  keymap.set("n", "<leader>dr",   dap.repl.open,                                { desc = "[d]ebug [r]epl open"} )
end

local dapui_loaded, dapui = pcall(require, "dapui")
if dapui_loaded then
  keymap.set("n", "<leader>do",   dapui.open,                                   { desc = "[d]ebug UI [o]pen" })
  keymap.set("n", "<leader>dc",   dapui.close,                                  { desc = "[d]ebug UI [c]close" })
end

local neotree_loaded, neotree  = pcall(require, "neo-tree.command")
if neotree_loaded then
  local open_neotree = function ()
    neotree.execute({
      reveal=true
    })
  end
  keymap.set("n", "<leader>e", open_neotree, { desc = "Open N[E]oTree" })
end
