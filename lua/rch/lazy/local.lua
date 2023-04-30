-- my own plugins

-- Utility function that will pick the local version of the plugin if available
-- and fallback on the github version
local function add_plugin_path(name, node)
  local expected_local_path = os.getenv("HOME") .. "/Documents/projects/" .. name

  if require("rch.utils").dir_exists(expected_local_path) then
    node.dir = expected_local_path
  else
    node[1] = "romainchapou/" .. name
  end

  return node
end

return {
  add_plugin_path("confiture.nvim", {
    cmd = { "Confiture", "ConfitureTerm", "ConfitureDispatch" },
    dependencies = "tpope/vim-dispatch",
  }),

  add_plugin_path("nostalgic-term.nvim", {
    opts = {
      mappings = {
        {'<c-h>', 'h'},
        {'<c-j>', 'j'},
        {'<c-k>', 'k'},
        {'<c-l>', 'l'},
        {'<c-n>', 'gt'},
        {'<c-b>', 'gT'},
      },
      add_normal_mode_mappings = true,
    }
  }),

  { dir = "~/Documents/projects/gtest_confiture.nvim/", ft = "cpp" },
}
