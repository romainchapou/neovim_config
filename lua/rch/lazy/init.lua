-- misc plugins with short configurations

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {{ "junegunn/fzf", build = "./install --all" }},
    opts = {
      winopts = { backdrop = 100 }
    }
  },

  -- vanilla style plugins

  "romainl/vim-cool",
  "tpope/vim-eunuch",
  "bkad/CamelCaseMotion",
  { "tpope/vim-abolish", cmd = {"S", "Abolish"}, keys = "cr" },
  { "rbgrouleff/bclose.vim", cmd = "Bclose"},
  { "Yohannfra/Vim-Goto-Header", ft = {"cpp", "c"} },
  {
    "tpope/vim-surround",
    dependencies = "tpope/vim-repeat"
  },
  {
    "sgur/vim-textobj-parameter",
    dependencies = "kana/vim-textobj-user",
    keys = { { "i,", mode = "o" }, { "a,", mode = "o" } },
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    event = "VeryLazy",
  },
  { "bronson/vim-visual-star-search", keys = {{"*", mode = "x"}}},

  -- "modern" style plugins

  "tmsvg/pear-tree",
  { "junegunn/goyo.vim", cmd = "Goyo" },
  {
    "karb94/neoscroll.nvim", opts = {
      easing_function = "sine",
      hide_cursor = false,
      mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
    }
  },

  -- { 'echasnovski/mini.completion', version = false, opts = {} },

  -- not very much used zone

  "AndrewRadev/linediff.vim",
  { "romainl/vim-qf", ft = "qf" },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "majutsushi/tagbar", cmd = "TagbarToggle" },
  -- { "simnalamburt/vim-mundo", event = "VeryLazy" },
  -- "gyim/vim-boxdraw",
  -- "nvim-lua/plenary.nvim",
}
