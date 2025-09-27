-- Disable VS-Code-hostile extras
return {
    { "nvim-mini/mini.animate", cond = not vim.g.vscode },
    { "sphamba/smear-cursor.nvim", cond = not vim.g.vscode },
}
