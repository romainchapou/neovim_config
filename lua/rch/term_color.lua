local M = {}

function M.get_term_color()
  local term_color_file = os.getenv("HOME") .. "/.term_color"

  if not vim.fn.filereadable(term_color_file) then
    return nil
  end

  local lines = vim.fn.readfile(term_color_file)

  if #lines >= 1 then
    return lines[1]
  else
    return nil
  end
end

return M
