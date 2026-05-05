return {
    -- TokyoNight "night": deeper contrast + protanopia-friendly gitsigns
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "night",
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                sidebars = "dark",
                floats = "dark",
            },
            on_highlights = function(hl, c)
                hl.WinSeparator = { fg = c.blue0, bold = true }
                -- Pin gitsigns to storm's colors
                hl.GitSignsAdd = { fg = "#2EA043" }
                hl.GitSignsChange = { fg = "#0078D4" }
                hl.GitSignsDelete = { fg = "#F85149" }
            end,
        },
    },

    -- Bufferline: padded slant tabs with cyan accents (protanopia-friendly)
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                separator_style = "padded_slant",
                indicator = { style = "underline" },
            },
            highlights = {
                buffer_selected = { fg = "#7dcfff", bold = true, italic = false },
                indicator_selected = { fg = "#7dcfff" },
                indicator_visible = { fg = "#7dcfff" },
            },
        },
    },

    -- Rainbow delimiters: colorful matching brackets/parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "BufReadPost",
    },

    -- Inline color previews for hex/rgb/hsl values
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPost",
        opts = {
            user_default_options = {
                names = false,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
            },
        },
    },
}
