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

  -- github
  -- NOTE: need to run :GithubThemeCompile when changing this
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          hide_nc_statusline = false,
          hide_end_of_buffer = false,

          styles = {
            keywords = "NONE"
          },
        },

        groups = {
          github_light = {
            StatusLine = { bg = "#eff1f5", fg = "black" },
            StatusLineNC = { bg = "#eff1f5", fg = "grey" },
          }
        },

        specs = {
          github_light = {
            syntax = {
              string = "green",
              type = "#d15705",
            },
          },
        }
      })
    end,
  },

  -- "frenzyexists/aquarium-vim", { 'branch': 'vimscript-version' }
  -- "ayu-theme/ayu-vim",
  -- "wojciechkepka/bogster",
  -- "drewtempelmeyer/palenight.vim",
  -- "b4skyx/serenade",
  -- "cormacrelf/vim-colors-github",
}

