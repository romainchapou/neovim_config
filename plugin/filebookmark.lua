-- Small utility to bookmark files and switch to them, using fzf-lua

local BOOKMARK_FILE = ".bookmarked_files.txt"


local function bookmarkCurrentFile()
  local cur_file_name = vim.fn.expand("%:~:.")

  if vim.fn.filereadable(BOOKMARK_FILE) == 1 then
    for line in io.lines(BOOKMARK_FILE) do
      if line == cur_file_name then
        print("Already bookmarked " .. cur_file_name)
        return
      end
    end
  end

  vim.fn.writefile({cur_file_name}, BOOKMARK_FILE, "a")

  print("Bookmarked " .. cur_file_name)
end


local function promptBookmarkedFile()
  -- skip if no bookmark file
  if vim.fn.filereadable(BOOKMARK_FILE) == 0 then
    print("No bookmark file")
    return
  end

  local function switchToSelectedFile(selection)
    if #selection == 0 then return end -- no switch if empty selection

    vim.cmd(":edit " .. selection[1])
  end

  -- @Improve: authorize only one selected entry
  local opts = {}
  opts.actions = {['default'] = switchToSelectedFile}
  opts.previewer = "builtin"

  require("fzf-lua").fzf_exec(function(fzf_cb)
    for line in io.lines(BOOKMARK_FILE) do
      fzf_cb(line)
    end
    fzf_cb() -- EOF
  end, opts)
end


local nmap = require("rch.utils").nmap

nmap("<leader><Space>", bookmarkCurrentFile)
nmap("<C-Space>", promptBookmarkedFile)
