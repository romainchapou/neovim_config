local M = {}

-- Load a different colorscheme depending of the term color defined in ~/.term_color.
-- The default is solarized light.

local term_color = require("rch.term_color").get_term_color()

if term_color == "nord" then
  table.insert(M, { "itchyny/lightline.vim", config = function()
    vim.g.lightline = { colorscheme = "nord" }
  end })
  table.insert(M, { "arcticicestudio/nord-vim", priority = 1000, config = function()
    vim.cmd([[colorscheme nord]])
    vim.g.background = "dark"
  end })
else
  table.insert(M, { "lifepillar/vim-solarized8", priority = 1000, config = function()
    vim.cmd([[colorscheme solarized8_flat]])

    if term_color ~= "light" then
      vim.g.background = "dark"
    else
      vim.g.background = "light"
    end
  end })
end

-- "frenzyexists/aquarium-vim", { 'branch': 'vimscript-version' }
-- "ayu-theme/ayu-vim",
-- "wojciechkepka/bogster",
-- "drewtempelmeyer/palenight.vim",
-- "b4skyx/serenade",
-- "cormacrelf/vim-colors-github",

return M
