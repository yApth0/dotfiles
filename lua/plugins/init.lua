return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    { import = "nvchad.blink.lazyspec" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "cpp", "cmake"
            },
        },
    },
    {
        "nvim-mini/mini.surround",
        version = "*",
    },
    { 'nvim-mini/mini.align',          
        version = '*' 
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim",
            "m00qek/baleia.nvim",            -- optional
            "nvim-telescope/telescope.nvim", -- optional
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = 
        { 
            'nvim-treesitter/nvim-treesitter', 
            'nvim-mini/mini.icons' 
        },
        opts = {},
    }
}
