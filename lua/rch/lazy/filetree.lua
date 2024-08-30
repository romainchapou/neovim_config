return {
  -- {
  --   "lambdalisue/fern.vim",
  --   dependencies = "lambdalisue/fern-hijack.vim"
  -- },
  {
    'https://github.com/stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        skip_confirm_for_simple_edits = true,
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
      vim.keymap.set("n", "<M-k>", "gf", { desc = "Open file under cursor" })
    end
  },
}
