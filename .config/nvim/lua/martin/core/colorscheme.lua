-- Set colorscheme
vim.cmd.colorscheme "adwaita"
vim.g.adwaita_darker = true             -- for darker version
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.g.adwaita_transparent = true        -- makes the background transparent
vim.cmd('colorscheme adwaita')

-- Set status bar
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'adwaita',
  },
})

-- require('catppuccin').setup({
--   flavour = "mocha",
--   color_overrides = {
--     mocha = {
--       base = '#1e222a',
--     }
--   }
-- })

-- local ctp_feline = require('catppuccin.groups.integrations.feline')
--
-- ctp_feline.setup({})
--
-- require("feline").setup({
--   components = ctp_feline.get(),
-- })
