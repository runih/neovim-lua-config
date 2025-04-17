local opt = vim.opt -- for conciseness

-- Neovide settings
opt.guifont = { 'Iosevka_NFM_Light:h15' }

-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_opacity = 0.8
vim.g.transparency = 0.8

-- Floating Blur Amount
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_scroll_animation_length = 0.1

-- Hiding the mouse when typing
vim.g.neovide_hide_mouse_when_typing = true

-- Remember Previous Window Size
vim.g.neovide_remember_window_size = true

-- Use Logo Key (doesn't seem to work)
vim.g.neovide_input_use_logo = true -- true on macOS

-- Animation Length
vim.g.neovide_cursor_animation_length = 0.08

-- Animation Trail Size
vim.g.neovide_cursor_trail_size = 0.8

-- Antialiasing
vim.g.neovide_cursor_antialiasing = true

-- Unfocused Outline Width
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- Cursor Particles
-- Modes: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_vfx_mode = 'wireframe'
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0

local set_font_size_picker = function()
  local guifont = vim.opt.guifont:get()[1]
  local current_font = guifont:match('([^:]+)')
  vim.ui.input({
    prompt = 'Font Size: ',
    default = guifont:match('h(%d+)'),
  }, function(input)
    if input then
      local new_font_size = tonumber(input)
      if new_font_size then
        vim.g.neovide_scale_factor = new_font_size / 15
        opt.guifont = { current_font .. ':h' .. new_font_size }
      else
        print('Invalid font size')
      end
    end
  end)
end

vim.keymap.set('n', '<leader>ns', set_font_size_picker, {
  desc = 'Set font size',
})
