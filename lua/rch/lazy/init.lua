-- misc plugins with short configurations

-- TODO voir
-- https://github.com/kwkarlwang/bufresize.nvim
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/yorickpeterse/nvim-pqf
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/ruifm/gitlinker.nvim
-- https://github.com/folke/trouble.nvim
-- https://github.com/folke/zen-mode.nvim
-- https://github.com/folke/twilight.nvim
--
-- checkd:
-- https://github.com/lukas-reineke/indent-blankline.nvim
--
--
--
--
--
--
--
--
-- ok: tsjtoggle
return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {{ "junegunn/fzf", build = "./install --all" }},
    opts = {
      winopts = { backdrop = 100 },
      previewers = { builtin = { treesitter = false }}
    }
  },

  -- vanilla style plugins

  "romainl/vim-cool",
  "tpope/vim-eunuch",
  "bkad/CamelCaseMotion",
  { "tpope/vim-abolish", cmd = {"S", "Abolish"}, keys = "cr" },
  -- TODO voir pour remplacer par https://github.com/famiu/bufdelete.nvim
  { "rbgrouleff/bclose.vim", cmd = "Bclose"},
  { "Yohannfra/Vim-Goto-Header", ft = {"cpp", "c"} },
  {
    "tpope/vim-surround",
    dependencies = "tpope/vim-repeat"
  },
  {
    "sgur/vim-textobj-parameter",
    dependencies = "kana/vim-textobj-user",
    keys = { { "i,", mode = {"o", "x"} }, { "a,", mode = {"o", "x"} } },
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    event = "VeryLazy",
  },
  { "bronson/vim-visual-star-search", keys = {{"*", mode = "x"}}},
  {
    'BranimirE/fix-auto-scroll.nvim',
    config = true,
    event = 'VeryLazy'
  },

  -- "modern" style plugins

  "tmsvg/pear-tree",
  { "junegunn/goyo.vim", cmd = "Goyo" },
  {
    "karb94/neoscroll.nvim", opts = {
      easing_function = "sine",
      hide_cursor = false,
      mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
    },
    enabled = not vim.g.neovide
  },

  -- { 'echasnovski/mini.completion', version = false, opts = {} },

  -- not very much used zone
  -- "lukas-reineke/indent-blankline.nvim",

  "AndrewRadev/linediff.vim",
  { "romainl/vim-qf", ft = "qf" },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "majutsushi/tagbar", cmd = "TagbarToggle" },
  -- { "simnalamburt/vim-mundo", event = "VeryLazy" },
  -- "gyim/vim-boxdraw",
  -- "nvim-lua/plenary.nvim",

  -- {
  --   "brenoprata10/nvim-highlight-colors", opts = {
  --     render = "virtual",
  --     event = "VeryLazy",
  --   }
  -- },
}
