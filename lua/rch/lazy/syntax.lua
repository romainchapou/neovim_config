-- syntax plugins

return {
  {
    "vimwiki/vimwiki", event = "BufEnter *.md", ft = "markdown",
    config = function()
      -- TODO improve (just set syntax=vimwiki if ft == markdown)
      vim.schedule(function() vim.cmd("edit") end)
    end },
  {"ssteinbach/vim-pico8-syntax", ft = "pico8" },
  { "tikhomirov/vim-glsl", ft = "glsl" },
  -- "habamax/vim-godot",
}
