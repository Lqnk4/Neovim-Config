local M = {
  "rebelot/heirline.nvim",
  disabled = true
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
}

M.config = function()
  local heirline = require("heirline")
  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
  local colors = require('kanagawa.colors').setup()

  conditions.buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end

  conditions.hide_in_width = function(size)
    return vim.api.nvim_get_option_value("columns", { scope = "local" }) > (size or 140)
  end

  local Align = { provider = "%=", hl = { bg = colors.crust } }
  local Space = { provider = " " }

  local ViMode = {
    {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      static = {
        MODE_NAMES = {
          ["!"] = "SHELL",
          ["R"] = "REPLACE",
          ["Rc"] = "REPLACE",
          ["Rv"] = "V-REPLACE",
          ["Rvc"] = "V-REPLACE",
          ["Rvx"] = "V-REPLACE",
          ["Rx"] = "REPLACE",
          ["S"] = "S-LINE",
          ["V"] = "V-LINE",
          ["Vs"] = "V-LINE",
          ["\19"] = "S-BLOCK",
          ["\22"] = "V-BLOCK",
          ["\22s"] = "V-BLOCK",
          ["c"] = "COMMAND",
          ["ce"] = "EX",
          ["cv"] = "EX",
          ["i"] = "INSERT",
          ["ic"] = "INSERT",
          ["ix"] = "INSERT",
          ["n"] = "NORMAL",
          ["niI"] = "NORMAL",
          ["niR"] = "NORMAL",
          ["niV"] = "NORMAL",
          ["no"] = "O-PENDING",
          ["noV"] = "O-PENDING",
          ["no\22"] = "O-PENDING",
          ["nov"] = "O-PENDING",
          ["nt"] = "NORMAL",
          ["ntT"] = "NORMAL",
          ["r"] = "REPLACE",
          ["r?"] = "CONFIRM",
          ["rm"] = "MORE",
          ["s"] = "SELECT",
          ["t"] = "TERMINAL",
          ["v"] = "VISUAL",
          ["vs"] = "VISUAL",
        },
        MODE_COLORS = {
          [""] = colors.yellow,
          [""] = colors.yellow,
          ["s"] = colors.yellow,
          ["!"] = colors.maroon,
          ["R"] = colors.flamingo,
          ["Rc"] = colors.flamingo,
          ["Rv"] = colors.rosewater,
          ["Rx"] = colors.flamingo,
          ["S"] = colors.teal,
          ["V"] = colors.lavender,
          ["Vs"] = colors.lavender,
          ["c"] = colors.peach,
          ["ce"] = colors.peach,
          ["cv"] = colors.peach,
          ["i"] = colors.green,
          ["ic"] = colors.green,
          ["ix"] = colors.green,
          ["n"] = colors.blue,
          ["niI"] = colors.blue,
          ["niR"] = colors.blue,
          ["niV"] = colors.blue,
          ["no"] = colors.pink,
          ["no"] = colors.pink,
          ["noV"] = colors.pink,
          ["nov"] = colors.pink,
          ["nt"] = colors.red,
          ["null"] = colors.pink,
          ["r"] = colors.teal,
          ["r?"] = colors.maroon,
          ["rm"] = colors.sky,
          ["s"] = colors.teal,
          ["t"] = colors.red,
          ["v"] = colors.mauve,
          ["vs"] = colors.mauve,
        },
      },
      provider = function(self)
        local mode = self.mode:sub(1, 1)
        return string.format("▌ %s ", self.MODE_NAMES[mode])
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.MODE_COLORS[mode], bg = colors.mantle, bold = true }
      end,
      update = {
        "ModeChanged",
      },
    },
    {
      provider = "",
      hl = { bg = colors.crust, fg = colors.mantle },
    },
  }


  heirline.setup({
    statusline = {
      ViMode,
    },
    opts = {
      colors = colors
    }
  })
end

return M
