-- a new file each day
local function get_current_wtf_filename()
  local WTFDIR = os.getenv("HOME") .. "/.wtf_counter"
  local WTF_FILE = WTFDIR .. "/" .. os.date("%Y-%m-%d")

  if vim.fn.isdirectory(WTFDIR) ~= 1 then
    vim.fn.mkdir(WTFDIR, "p")
  end

  return WTF_FILE
end

local function add_wtf_counter()
  local cur_counter = 0
  local FILENAME = get_current_wtf_filename()

  if vim.fn.filereadable(FILENAME) == 1 then
    local file = vim.fn.readfile(FILENAME)

    if #file >= 1 then
      local possible_number = tonumber(file[1])

      if possible_number ~= nil then
        cur_counter = possible_number
      end
    end

    print(vim.inspect(file))
  end

  cur_counter = cur_counter + 1

  vim.fn.writefile({cur_counter}, FILENAME)

  print("wtf count now at " .. cur_counter .. " for today")
end

require("rch.utils").nmap("<leader>x", add_wtf_counter)
