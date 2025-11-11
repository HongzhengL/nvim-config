return {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    config = function()
        require("clangd_extensions").setup({
            server = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            },
            extensions = {
                autoSetHints = true,
                inlay_hints = {
                    inline = false,
                    only_current_line = false,
                    only_current_line_autocmd = "CursorHold",
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                    max_len_align = false,
                    max_len_align_padding = 1,
                    right_align = false,
                    right_align_padding = 7,
                    highlight = "Comment",
                },
            },
        })

        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({
            on_attach = function(client, bufnr)
                require("clangd_extensions.inlay_hints").setup_autocmd()
                require("clangd_extensions.inlay_hints").set_inlay_hints()
                vim.keymap.set("n", "<leader>lh", ":ClangdToggleInlayHints<CR>", { buffer = bufnr })
                -- more clangd_extensions keymaps if desired
            end,
        })
    end,
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },
    { "wakatime/vim-wakatime", lazy = false },
}
