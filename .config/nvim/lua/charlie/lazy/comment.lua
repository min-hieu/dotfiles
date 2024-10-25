return {
  'numToStr/Comment.nvim',
  opts = {
    padding = true,
    toggler = {
      ---Line-comment toggle keymap
      line = '<leader>c<leader>',
      ---Block-comment toggle keymap
      block = '<leader>b<leader>',
    },
    opleader = {
      ---Line-comment keymap
      line = '<leader>c',
      ---Block-comment keymap
      block = '<leader>b',
    },
  }
}
