-- Colorschemes and related plugins.

-- some color shotcuts for the github light theme
local light_grey = "#eff1f5"
local blue = "#0366d6"
local white = "#ffffff"
local brown = "#d15705"
local red = "#cb2431"
local green = "#28a745"

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

  -- github nvim theme
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
            StatusLine = { bg = light_grey, fg = "black" },
            StatusLineNC = { bg = light_grey, fg = "grey" },
            Folded = { bg = white, fg = "grey" },
            DiffText = { bg = light_grey, fg = blue },
            diffAdded = { bg = light_grey, fg = green },
            diffChanged = { bg = light_grey, fg = "#000000" },
            diffRemoved = { bg = light_grey, fg = red },
            FzfLuaBackdrop = { bg = white, fg = "black" },
            FzfLuaHeaderBind = { bg = white, fg = green },
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

