return {
  { "jovanlanik/fsplash.nvim",
    config = function()
      vim.cmd("set shortmess+=I")

      if vim.fn.argc() == 0 or vim.fn.line2byte('$') ~= 1 and not vim.opt.insertmode then
        require('fsplash').setup({lines = {
          "        ______             ",
          "jgs    /     /\\            ",
          "      /     /  \\           ",
          "     /_____/----\\_    (    ",
          "    \"     \"          ).    ",
          "   _ ___          o (:\') o ",
          "  (@))_))        o ~/~~\\~ o",
          "                  o  o  o  ",
        }})

        require('fsplash').open_window()
      end
    end
  },
}
