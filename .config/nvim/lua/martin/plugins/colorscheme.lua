return {
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "adwaita"
			vim.g.adwaita_darker = true             -- for darker version
			vim.g.adwaita_disable_cursorline = true -- to disable cursorline
			vim.g.adwaita_transparent = true        -- makes the background transparent
			vim.cmd('colorscheme adwaita')
		end,

	},
}
