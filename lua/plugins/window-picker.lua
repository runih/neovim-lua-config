return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    local window_picker_loaded, window_picker = pcall(require, 'window-picker')
    if window_picker_loaded then
      window_picker.setup()
    end
  end,
}
