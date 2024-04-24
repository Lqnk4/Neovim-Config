local Kanagawa = {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    compile = true,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)

    vim.cmd('colorscheme kanagawa')
  end
}

local Evergarden = {
  'comfysage/evergarden',
  opts = {
    transparent_background = false,
    contrast_dark = 'hard', -- 'hard'|'medium'|'soft'
    overrides = {},           -- add custom overrides
    priority = 1000,
  },
  config = function (_, opts)
    require('evergarden').setup(opts)
    vim.cmd('colorscheme evergarden')
  end
}

local RosePine = {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  config = function (_, opts)
    require('rose-pine').setup(opts)
    vim.cmd('colorscheme rose-pine')
  end
}

return Kanagawa
