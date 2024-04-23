local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
  local cmp = require('cmp')
  cmp.setup({
    sources = {
      {name = 'nvim_lsp'},
      {name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert({
      -- Enter key confirms completion item
      ['<CR>'] = cmp.mapping.confirm({select = true}),

      -- Ctrl + space triggers completion menu
      ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
		 	 completion = cmp.config.window.bordered(),
			 documentation = cmp.config.window.bordered(),
		},
  })
end

return M
