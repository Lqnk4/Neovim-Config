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
    priority = 1000 
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
  },
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' }
  },
  {
    'mbbill/undotree',
    lazy = false,
  },
}
