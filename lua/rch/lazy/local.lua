-- my own plugins

-- Utility function that will pick the local version of the plugin if available
-- and fallback on the github version
local function add_plugin_path(name, node, fallback_github)
  if fallback_github == nil then fallback_github = true end

  local expected_local_path = ""

  if os.getenv("HOME") ~= nil then
    expected_local_path = os.getenv("HOME") .. "/Documents/projects/" .. name
  end

  if fallback_github then
    node[1] = "romainchapou/" .. name
  elseif vim.fn.isdirectory(expected_local_path) == 1 then
    node.dir = expected_local_path
  else
    -- for custom plugins with no public github repo, if not present
    -- locally then simply don't load
    return nil
  end

  return node
end

return {
  add_plugin_path("confiture.nvim", {
    cmd = { "Confiture", "ConfitureTerm", "ConfitureDispatch" },
    event = "BufRead project.conf",
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

  add_plugin_path("gtest_confiture.nvim", { ft = "cpp" }, false),
}
