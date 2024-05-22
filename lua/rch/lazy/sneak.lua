return {
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
}
