local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      dofile(vim.g.base46_cache .. "lsp")
      require "nvchad.lsp"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "stevearc/conform.nvim",
    -- for users those who want auto-save conform + lazyloading!
    event = { "BufWritePre" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {

    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      { "f3fora/cmp-spell" },
    },
  },
  -- load git related plugin
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
    dependencies = {
      -- scrollbar
      {
        "petertriho/nvim-scrollbar",
        -- lazy = false,
        opts = overrides.scrollbar,
        config = function(_, opts)
          require("scrollbar").setup(opts)
        end,
      },
      -- not related, but make use of the gitsigns lazy loading
      {
        "sindrets/diffview.nvim",
        -- lazy = false,
        config = function()
          require("diffview").setup()
        end,
      },
    },

    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    init = function()
      -- use twig parser for nunjucks until native nunjucks parser is available
      vim.treesitter.language.register("twig", "nunjucks")
      vim.treesitter.language.register("glimmer", "handlebars")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvimtree").opts,
  },

  -- Install a plugin
  {

    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  {
    "mg979/vim-visual-multi",
    event = "BufEnter",
  },
  -- surround text ysiw" cs'` ysiw)
  {
    "tpope/vim-surround",
    lazy = false,
  },
  -- move line text <A-hjkl>
  {
    "matze/vim-move",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "dyng/ctrlsf.vim",
    lazy = false,
    config = function()
      vim.g.ctrlsf_auto_focus = { at = "start" }
      vim.g.ctrlsf_position = "right_local"
    end,
  },
  {
    "godlygeek/tabular",
    lazy = false,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "xml" },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}, -- must provide empty opts to enable lazy loading
  },
	{
    "ggandor/leap.nvim",
    init = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "SidOfc/mkdx",
    ft = { "markdown", "mermaid" },
    init = function()
      vim.g["mkdx#settings"] = { insert_indent_mappings = 1, tab = { enable = 0 } }
    end,
  },
  {
    "lervag/wiki.vim",
    ft = { "markdown" },
    lazy = false,
    init = function()
      vim.g.wiki_root = "~/Sync/wiki"
      vim.g.wiki_mappings_local_journal = {
        ["<plug>(wiki-journal-prev)"] = "[w",
        ["<plug>(wiki-journal-next)"] = "]w",
      }
    end,
  },
  {
    enabled = false,
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

return plugins
