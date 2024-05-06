local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- theme

	{ "nyoom-engineering/oxocarbon.nvim" },

	-- telescope

   	{
		"nvim-telescope/telescope.nvim", tag = '0.1.6',
		dependencies = { "nvim-lua/plenary.nvim" }
        },

	-- devicons

	{ "nvim-tree/nvim-web-devicons" },

	-- file-tree

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},

	-- bufferline

	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	-- lualine

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- autoclose

	{ "m4xshen/autoclose.nvim" },

	-- latex

	{ "lervag/vimtex" },
	{ "vigoux/ltex-ls.nvim" },

	-- discord presence

	{ "andweeb/presence.nvim" },

	-- lsp stuff

	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip" },
})

require("bufferline").setup{}
-- require("ltex-ls").setup{}
require("autoclose").setup{}

local lspconfig = require('lspconfig')

-- language server stuff

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"lua_ls",
	"tsserver",
	"rust_analyzer",
	"clangd",
	"ltex"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
	  capabilities = capabilities,
  }
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
