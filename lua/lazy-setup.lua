local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

local lazy_setup = lazy.setup("plugins", {
	dev = {
		path = "~/Projects/neovim-plugins",
		fallback = true,
	},
})

local config_file = io.open(vim.fn.stdpath("config") .. "/lua/local/setup.lua")

if config_file then
	config_file:close()
	require("local.setup")
end

return lazy_setup
