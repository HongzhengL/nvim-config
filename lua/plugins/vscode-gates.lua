-- Disable VS-Code-hostile extras
return {
    { "echasnovski/mini.animate",      cond = not vim.g.vscode },
    { "sphamba/smear-cursor.nvim",     cond = not vim.g.vscode },
  }
  