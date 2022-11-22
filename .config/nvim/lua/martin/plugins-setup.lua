local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

 local status, packer = pcall(require, "packer")
 if not status then 
	 return
 end

 return packer.startup(function(use)
	 use("wbthomason/packer.nvim") -- package installer

   use("nvim-lua/plenary.nvim") -- usefull lua functions

	 use("bluz71/vim-nightfly-guicolors") -- nightfly colorscheme

   -- use("sonph/onehalf") -- onehalf colorscheme

   use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
   
   use("tpope/vim-surround") -- surrouding

   use("vim-scripts/ReplaceWithRegister") -- replacing without copying

   use("numToStr/Comment.nvim") -- commenting

   use("nvim-lualine/lualine.nvim") -- status line

   use("nvim-tree/nvim-tree.lua") -- file explorer

   use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy finder
   use({ 'nvim-telescope/telescope.nvim', branch = "0.1.x" })

   -- autocompletion
   use("hrsh7th/nvim-cmp") -- completion plugin
   use("hrsh7th/cmp-buffer") -- source for text in buffer
   use("hrsh7th/cmp-path") -- source for file system paths

   -- snippets
   use("rafamadriz/friendly-snippets")

   -- managin and installing lsp servers
   use("williamboman/mason.nvim")
   use("williamboman/mason-lspconfig.nvim")

   -- conifguring lsp servers
   use("neovim/nvim-lspconfig")
   use("hrsh7th/cmp-nvim-lsp")
   use({ "glepnir/lspsaga.nvim", branch = "main" })
   use("jose-elias-alvarez/typescript.nvim")
   use("onsails/lspkind.nvim")

   -- treesitter
   use({
     "nvim-treesitter/nvim-treesitter",
     run = function()
       require("nvim-treesitter.install").update({ with_sync = true })
     end,
   })

   -- autoclosing
   use("windwp/nvim-autopairs")
   use("windwp/nvim-ts-autotag")

	 if packer_bootstrap then 
		 require("packer").sync()
	 end
 end)
