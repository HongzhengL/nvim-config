-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yy", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("keepjumps normal! ggyG")
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Yank Entire File" })
