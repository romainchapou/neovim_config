local M = {}

function M.get_term_color()
  if os.getenv("HOME") == nil then
    -- on windows probably, abort
    return nil
  end

  local term_color_file = os.getenv("HOME") .. "/.term_color"

  if vim.fn.filereadable(term_color_file) == 0 then
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
