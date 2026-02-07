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
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            -- put your config here
        end,
    },
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local colors = require("tokyonight.colors").setup()

            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
                        InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
                    },
                },
                window = {
                    placement = { horizontal = "right", vertical = "top" },
                    margin = { vertical = 0, horizontal = 1 },
                },
                render = function(props)
                    local bufname = vim.api.nvim_buf_get_name(props.buf)
                    if bufname == "" then
                        return { " [No Name] " }
                    end

                    local path = vim.fn.fnamemodify(bufname, ":p:~")
                    -- local modified = vim.bo[props.buf].modified and " ●" or ""

                    local filename = vim.fn.fnamemodify(bufname, ":t")
                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)

                    return {
                        { " ", icon, " ", guifg = color },
                        { path .. " " },
                    }
                end,
            })
        end,
    },
    -- {
    --     "chentoast/marks.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    -- },
}
