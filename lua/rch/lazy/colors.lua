-- Colorschemes and related plugins.

return {
  -- solarized
  {
    "lifepillar/vim-solarized8", lazy = true, priority = 1000
  },

  -- nord
  {
    "itchyny/lightline.vim", lazy = true, config = function()
      vim.g.lightline = { colorscheme = "nord" }
    end
  },
  {
    "arcticicestudio/nord-vim", lazy = true, priority = 1000,
    dependencies = "itchyny/lightline.vim"
  },

  -- "frenzyexists/aquarium-vim", { 'branch': 'vimscript-version' }
  -- "ayu-theme/ayu-vim",
  -- "wojciechkepka/bogster",
  -- "drewtempelmeyer/palenight.vim",
  -- "b4skyx/serenade",
  -- "cormacrelf/vim-colors-github",
}

