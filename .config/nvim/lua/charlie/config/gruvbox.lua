vim.o.termguicolors = true
vim.o.background    = "dark" 

require("gruvbox").setup({
  undercurl             = true,
  underline             = true,
  bold                  = true,
  italic                = true,
  strikethrough         = true,
  invert_selection      = false,
  invert_signs          = false,
  invert_tabline        = false,
  invert_intend_guides  = false,
  inverse               = true,
  contrast              = "hard",
  palette_overrides     = {},
  overrides             = {},
  dim_inactive          = false,
  transparent_mode      = false,
})

vim.cmd("colorscheme gruvbox")
