-- lazy.nvim plugin specs
-- plugins will be loaded in this order
return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'} 
  },
  {
    'rebelot/kanagawa.nvim',
    init = function()
      vim.cmd('colorscheme kanagawa-dragon')
    end
  }
}
