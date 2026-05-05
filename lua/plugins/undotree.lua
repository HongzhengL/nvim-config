-- ~/.config/nvim/lua/plugins/undotree.lua

return {
    "mbbill/undotree",
    keys = {
        { "<leader>U", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    },
}
