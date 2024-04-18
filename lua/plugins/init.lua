-- lazy.nvim plugin specs
-- plugins will be loaded in this order
return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim'} 
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").load('dragon')

      --Sets background transparent
      --vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
      --vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
    end
  }, 
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      vim.cmd('TSUpdate')
    end
  },
  {
    'nvim-treesitter/playground',
    lazy = true,
  }
}
