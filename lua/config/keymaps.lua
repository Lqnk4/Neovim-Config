local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffers
map("n", "<tab>", ":bn<cr>", {})
map("n", "<s-tab>", ":bp<cr>", {})


