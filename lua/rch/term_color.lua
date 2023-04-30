local M = {}

function M.get_term_color()
  local lines = require("rch.utils").lines_from(os.getenv("HOME") .. "/.term_color")

  if #lines >= 1 then
    return lines[1]
  else
    return nil
  end
end

return M
