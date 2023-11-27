local colorscheme = "bamboo"
local colorscheme_file = vim.fn.expand("~/.config/nvim/colorscheme")

local functions = {

	set_default_colorscheme = function()
		local file = io.open(colorscheme_file, "r")
		if file then
			colorscheme = file:read()
			file:close()
		end
		vim.cmd("colorscheme " .. colorscheme)
	end,

	change = function(selected_colorscheme)
		vim.cmd("colorscheme " .. selected_colorscheme)
		if vim.g.neovide then
			local normal_highlight = vim.api.nvim_get_hl_by_name("Normal", true)
			if normal_highlight and normal_highlight.background then
				vim.g.neovide_background_color = string.format("%06x", normal_highlight.background)
					.. string.format("%x", (255 * vim.g.transparency))
			end
		end
	end,

	save = function(selected_colorscheme)
		local file, err = io.open(colorscheme_file, "w")
		if file then
			file:write(tostring(selected_colorscheme))
			file:close()
			print(selected_colorscheme .. " saved as the default colorscheme")
		else
			print("Could not save colorschema: ", err)
		end
	end,

	toggle_background = function()
		if vim.o.background == "dark" then
			vim.o.background = "light"
		else
			vim.o.background = "dark"
		end
		if vim.g.neovide then
			local normal_highlight = vim.api.nvim_get_hl_by_name("Normal", true)
			if normal_highlight and normal_highlight.background then
				vim.g.neovide_background_color = string.format("%06x", normal_highlight.background)
					.. string.format("%x", (255 * vim.g.transparency))
			end
		end
	end,
}

return functions
