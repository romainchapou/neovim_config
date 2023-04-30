local utils = {}

local function map(mode, lhs, rhs, opts)
  if not opts then
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true})
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function utils.nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function utils.xmap(lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

function utils.omap(lhs, rhs, opts)
  map('o', lhs, rhs, opts)
end

function utils.file_exists(filename)
  local f = io.open(filename, "rb")
  if f then f:close() end
  return f ~= nil
end

function utils.dir_exists(dirname)
   local ok, _, code = os.rename(dirname, dirname)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function utils.lines_from(file)
  if not utils.file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

return utils
