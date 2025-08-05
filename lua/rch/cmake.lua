local M = {}

function M.find_related_cmake_file()
  local path = vim.fn.substitute(vim.api.nvim_buf_get_name(0), '/[^/]*$', '', '')

  while vim.fn.filereadable(path .. "/CMakeLists.txt") ~= 1 do
    if path == "" then return end

    path = vim.fn.substitute(path, '/[^/]*$', '', '')

    print(path)
  end

  vim.cmd("edit " .. path .. "/CMakeLists.txt")
end

return M
