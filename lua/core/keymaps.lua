-- Loading my functions
local myfunctions_loaded, myfunctions = pcall(require, "core.functions")
if not myfunctions_loaded then
    print("My functions not loaded!")
    return
end

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("t", "<C-W><C-N>", "<C-\\><C-N>", {remap = true }) -- Map <ctrl w>+<ctrl n> to exit terminal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- mine preferences
keymap.set("n", "<leader>cd", "<cmd>lcd %:h<CR>")
keymap.set("n", "<leader>so", myfunctions.load_current_luafile,           { desc = "[Lo]ading current lua file" })
keymap.set("n", "<leader>!", myfunctions.execute_current_line,            { desc = "Execute current line in to a buffer" })
keymap.set("n", "<C-CR>", "<cmd>new<cr>",                                 { desc = "Create a new buffer below" })
keymap.set("n", "<C-D-CR>", "<cmd>vnew<cr>",                              { desc = "Create a new buffer on the right side" })
-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

-- telescope
local builtin_loaded, builtin = pcall(require, "telescope.builtin")
if builtin_loaded then
  keymap.set("n", "<leader>sB",       builtin.builtin,                    { desc = "[S]earch Telescope [B]uiltin" })
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
  keymap.set("n", "<leader>sc",       builtin.colorscheme,                { desc = "[S]Search [C]olorscheme" })
  keymap.set("n", "|",                myfunctions.find_in_current_buff,   { desc = "[|] Search in current buffer" })
  keymap.set("n", "<leader>sn",       myfunctions.nvim_config,            { desc = "[S]earch [N]eoVim configurations" })
  keymap.set("n", "<leader>.",        myfunctions.command_history,        { desc = "Command History" })
  -- Git mappings
  keymap.set("n", "<leader>GB",       builtin.git_branches,               { desc = "[G]it [B]ranches" })
  keymap.set("n", "<leader>Gc",       builtin.git_commits,                { desc = "[G]it [C]ommits" })
  keymap.set("n", "<leader>Gb",       builtin.git_bcommits,               { desc = "[G]it [B]uffer [C]ommits" })
  keymap.set("n", "<leader>Gs",       builtin.git_status,                 { desc = "[G]it [S]tatus" })
  keymap.set("n", "<leader>GS",       builtin.git_stash,                  { desc = "[G]it [S]tash" })
end

local telescope_tabs_loaded, telescope_tabs = pcall(require, "telescope-tabs")
if telescope_tabs_loaded then
  keymap.set("n", "<leader>t", telescope_tabs.list_tabs,                  { desc = "List [T]abs" })
end

-- JSON formatting
keymap.set("n", "<leader>Fj", "<cmd>JSONFormatter<cr>",                   { desc = "[F]ormat [J]son" })

-- For Testing lua files
keymap.set("n", "<leader>T", "<Plug>PlenaryTestFile",                     { desc = "Plenary[T]estFile" })

-- Alpha
keymap.set("n", "<leader>a", "<cmd>Alpha<CR>",                            { desc = "[A]lpha" })

-- Mason
keymap.set("n", "<leader>M", "<cmd>Mason<CR>",                            { desc = "[M]ason" })

-- Lazy
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>",                             { desc = "[L]azy" })

-- LazyGit
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>",                         { desc = "LazyGit" })

-- debugging
local dap_loaded, dap = pcall(require, "dap")
if dap_loaded then
  keymap.set("n", "<F2>",         dap.continue,                                             { desc = "[F2] Debug continue" })
  keymap.set("n", "<F3>",         dap.step_into,                                            { desc = "[F3] Debug Step Into" })
  keymap.set("n", "<F4>",         dap.step_over,                                            { desc = "[F4] Debug Stop Over" })
  keymap.set("n", "<F5>",         dap.step_out,                                             { desc = "[F5] Debug Stop Out" })
  keymap.set("n", "<leader>b",    dap.toggle_breakpoint,                                    { desc = "Toggle [b]reakpoint" })
  keymap.set("n", "<leader>B",    myfunctions.breakpoint_with_condition,                    { desc = "Toggle [B]reakpoint with condition"})
  keymap.set("n", "<leader>lp",   myfunctions.breakpoint_based_on_log_point_message,        { desc = "Toggle breakpoint based on [l]og [p]oint message" })
  keymap.set("n", "<leader>dr",   dap.repl.open,                                            { desc = "[d]ebug [r]epl open"} )
  local dapui_loaded, dapui = pcall(require, "dapui")
  if dapui_loaded then
    keymap.set("n", "<leader>do",   dapui.open,                                             { desc = "[d]ebug UI [o]pen" })
    keymap.set("n", "<leader>dc",   dapui.close,                                            { desc = "[d]ebug UI [c]close" })
  end
end

keymap.set("n", "<c-e>", myfunctions.open_neotree,                                          { desc = "Open N[E]oTree" })
