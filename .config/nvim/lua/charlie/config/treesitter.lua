require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "c", "lua", "rust", "python", "wgsl" },

  sync_install = false,
  auto_install = true,

  indent = {
    enable = false
  },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
