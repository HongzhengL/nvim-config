-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.winbar = "%=%m %f"

vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
-- vim.opt.tabstop = 2 -- Number of spaces a <Tab> counts for

vim.opt.shiftwidth = 4 -- Number of spaces used for auto-indentation
-- vim.opt.shiftwidth = 2 -- Number of spaces used for auto-indentation

vim.opt.expandtab = true -- Use spaces instead of tabs
-- vim.opt.expandtab = false

-- vim.g.autoformat = false

if not vim.g.vscode then -- ordinary terminal or ssh
    vim.o.clipboard = "unnamedplus"

    local function paste()
        return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = { ["+"] = paste, ["*"] = paste },
    }
else -- running inside VS Code
    vim.o.clipboard = "unnamedplus" -- let the extension keep its own provider
end
