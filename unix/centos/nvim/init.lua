-- ====================================================================
-- MINIMAL INIT.LUA FOR NVIM, SHOULD WORK WITH EVERY NVIM
-- ====================================================================

-- --- General Settings ---
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative numbers (great for quick jumping)
vim.opt.mouse = "a" -- Enable mouse support in the terminal
vim.opt.clipboard = "unnamedplus" -- Use system clipboard natively
vim.opt.termguicolors = true -- Enable true color support for themes

-- --- Tabs & Indentation ---
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Insert indents automatically

-- --- Search Tweaks ---
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ...unless search string contains capitals
vim.opt.hlsearch = false -- Clear highlights after search is done

-- --- System Performance Tweaks ---
vim.opt.swapfile = false -- Disable swap files to save disk writes on old hardware
vim.opt.backup = false -- Disable backup files
vim.opt.updatetime = 300 -- Faster completion/response time (default is 4000ms)

-- --- Core Custom Keyboard Remaps ---
-- Set your Leader key to Spacebar
vim.g.mapleader = " "

-- Quick save with Space + w
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- Clear search highlighting with Space + h
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Easily navigate split windows using Control + Arrow Keys
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

-- ====================================================================
-- NATIVE LANGUAGE SERVER (LSP) CONFIGURATION
-- ====================================================================

-- Create a common keymapping function when an LSP connects to a file
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- Keyboard Shortcuts for Code Navigation:
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts) -- 'gd' jumps to code definition
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts) -- 'K' shows documentation popup
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts) -- Space + rn renames variables globally
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts) -- Jump to next code error
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts) -- Jump to previous code error
end

-- Initialize the built-in handlers for your installed tools
local lsp = vim.lsp

-- Activate Python Support
-- sudo pkg install python3 py311-python-lsp-server
if vim.fn.executable("pylsp") == 1 then
	lsp.start({ name = "pylsp", cmd = { "pylsp" }, on_attach = on_attach })
end

-- Activate C / C++ Support
-- sudo pkg install llvm clang-devel
if vim.fn.executable("clangd") == 1 then
	lsp.start({ name = "clangd", cmd = { "clangd" }, on_attach = on_attach })
end

-- Activate Rust Support
if vim.fn.executable("rust-analyzer") == 1 then
	lsp.start({ name = "rust-analyzer", cmd = { "rust-analyzer" }, on_attach = on_attach })
end
