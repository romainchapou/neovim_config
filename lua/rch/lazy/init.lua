return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {{ "junegunn/fzf", build = "./install --all" }}
  },
  {
    "lambdalisue/fern.vim",
    dependencies = "lambdalisue/fern-hijack.vim"
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
    keys = { "gc", {"gc", mode = "x"} },
  },
  { "bronson/vim-visual-star-search", keys = {{"*", mode = "x"}}},

  -- "modern" style plugins

  "tmsvg/pear-tree",
  { "junegunn/goyo.vim", cmd = "Goyo" },
  {
    "karb94/neoscroll.nvim", opts = {
      easing_function = "sine",
      mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
    }
  },
  {
    "justinmk/vim-sneak",
    init = function()
      -- it's necessary to do this now as this also makes sure sneak doesn't
      -- override the default s and S behaviour
      vim.keymap.set("n", "<space>", "<Plug>Sneak_s")
      vim.keymap.set("n", "<space><space>", "<Plug>Sneak_S")
      vim.keymap.set("x", "<space>", "<Plug>Sneak_s")
      vim.keymap.set("x", "<space><space>", "<Plug>Sneak_S")

      vim.g["sneak#label"] = 1
      vim.g["sneak#use_ic_scs"] = 1
    end
  },

  -- { 'echasnovski/mini.completion', version = false, opts = {} },

  {
    'https://github.com/stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<M-h>"] = "actions.select_split",
          ["<M-l>"] = "actions.refresh",
          ["<backspace>"] = "actions.parent",
          ["<M-k>"] = "actions.select",
          ["<M-j>"] = "actions.parent",
          ["<tab>"] = "<c-^>",
        },
      }

      vim.keymap.set("n", "<M-j>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  },

  -- not very much used zone

  "AndrewRadev/linediff.vim",
  { "romainl/vim-qf", ft = "qf" },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "majutsushi/tagbar", cmd = "TagbarToggle" },
  -- { "simnalamburt/vim-mundo", event = "VeryLazy" },
  -- "gyim/vim-boxdraw",
  -- "nvim-lua/plenary.nvim",
}
