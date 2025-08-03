vim.cmd("set clipboard=unnamedplus")
vim.cmd("set mouse=")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set number")
vim.cmd("set ignorecase")
vim.cmd("set mouse=a")
vim.cmd("set undofile")

vim.cmd("autocmd BufWritePre * %s/\\s\\+$//e")  -- strip trailing whitespaces on-save

-- Easier moving in tabs and windows
vim.cmd("noremap <C-J> <C-W>j")
vim.cmd("noremap <C-K> <C-W>k")
vim.cmd("noremap <C-L> <C-W>l")
vim.cmd("noremap <C-H> <C-W>h")

vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- loads stuff from pluings directory
