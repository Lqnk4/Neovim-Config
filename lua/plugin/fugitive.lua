local M = {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { '<leader>gs', vim.cmd.Git },
  },
}

return M

