-- lazy.nvim plugin specs
-- plugins will be loaded in this order
return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim'} 
  },
  {
    'nvim-treesitter/playground',
    lazy = false,
  },
  {
    'mbbill/undotree',
    lazy = false,
  },
  {
    'tpope/vim-fugitive',
    lazy = false,
  },
}
