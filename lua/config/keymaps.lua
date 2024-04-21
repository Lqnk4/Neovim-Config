
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Telescope fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>ps', function()
 -- builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})


--Harpoon
local harpoon = require('harpoon')

-- REQUIRED
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-d>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>lm", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>ln", function() harpoon:list():next() end)

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
