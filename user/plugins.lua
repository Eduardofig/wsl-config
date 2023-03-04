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
    use 'nvim-treesitter/nvim-treesitter'
    use 'folke/lsp-colors.nvim'

    --rename
    use "smjonas/inc-rename.nvim"
    
    --rust tools
    use 'simrat39/rust-tools.nvim'

    -- function signature
    use "ray-x/lsp_signature.nvim"

    --terminal
    use "akinsho/toggleterm.nvim"

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

end)

