-- plugins
local packer = require 'packer'

packer.startup(function()
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'ray-x/cmp-treesitter'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- packer
    use 'wbthomason/packer.nvim'

    --color
    use 'folke/tokyonight.nvim'
    --use 'EdenEast/nightfox.nvim'
    use 'folke/lsp-colors.nvim'

    --treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-context'
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use "windwp/nvim-ts-autotag"

    --rename
    use 'smjonas/inc-rename.nvim'

    --rust tools
    use 'simrat39/rust-tools.nvim'

    -- function signature
    use 'ray-x/lsp_signature.nvim'

    --terminal
    use 'akinsho/toggleterm.nvim'

    --lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --nvim tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'nvim-tree/nvim-web-devicons'

    --commenting things
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    --auto pairs
    use 'windwp/nvim-autopairs'

    --telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use "AckslD/nvim-neoclip.lua"

    --harpoon
    use 'theprimeagen/harpoon'

    --undo tree
    use 'mbbill/undotree'

    --Git
    use "tpope/vim-fugitive"
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    --Copilot
    use "github/copilot.vim"

    -- Surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Standard colors
    use 'norcalli/nvim-colorizer.lua'

    -- Tailwind colors
    use "princejoogie/tailwind-highlight.nvim"

    use "aznhe21/actions-preview.nvim"

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    use "jose-elias-alvarez/null-ls.nvim"

    use({
        'Wansmer/treesj',
        requires = {
            'nvim-treesitter',
        },
        config = function()
            require('treesj').setup()
        end,
    })

    -- Todo Comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- nvim dap
    use 'mfussenegger/nvim-dap'
    use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use { "folke/neodev.nvim", opts = {} }
    use 'mxsdev/nvim-dap-vscode-js'
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
    }
    use 'leoluz/nvim-dap-go'


    -- nvim nio
    use 'nvim-neotest/nvim-nio'

    -- maximize windows
    use {
        'declancm/maximize.nvim',
        config = function() require('maximize').setup() end
    }

    use "lukas-reineke/indent-blankline.nvim"

    use "diepm/vim-rest-console"

    use "olexsmir/gopher.nvim"

    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    use "supermaven-inc/supermaven-nvim"

    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }
end)

