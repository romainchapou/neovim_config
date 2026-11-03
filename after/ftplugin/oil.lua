local function get_oil_current_file()
  local current_file = require("oil").get_cursor_entry().parsed_name
  local current_path = require("oil").get_current_dir()
  return '"' .. current_path .. current_file .. '"'
end

local function run_on_path_callback()
  vim.api.nvim_feedkeys(": " .. get_oil_current_file() .. "!", "", true)
end

vim.keymap.set("n", "!", run_on_path_callback, { desc = "Start cmd line prompt with file under cursor", buf = 0 })
