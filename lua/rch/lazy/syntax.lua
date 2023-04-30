-- syntax plugins

return {
  { "vimwiki/vimwiki", event = "BufEnter *.md", ft = "markdown" },
  {"ssteinbach/vim-pico8-syntax", ft = "pico8" },
  { "tikhomirov/vim-glsl", ft = "glsl" },
  -- "habamax/vim-godot",
}
