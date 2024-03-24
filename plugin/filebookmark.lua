-- Small utility to bookmark files and switch to them, using fzf-lua

local BOOKMARK_FILE = ".bookmarked_files.conf"


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


local function promptBookmarkedFile(delimit)
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

  opts.fzf_opts = { ['--tiebreak'] = "end,length" }

  if delimit then
    opts.fzf_opts['--delimiter'] = "/"
    opts.fzf_opts['--with-nth'] = "-1"
  end

  require("fzf-lua").fzf_exec(function(fzf_cb)
    for line in io.lines(BOOKMARK_FILE) do
      if #line > 0 and line:sub(1, 1) ~= '#' then
        fzf_cb(line)
      end
    end
    fzf_cb() -- EOF
  end, opts)
end


local nmap = require("rch.utils").nmap

nmap("<leader>B", bookmarkCurrentFile)
nmap("<leader>f", function() promptBookmarkedFile(true) end)
nmap("<s-leader><tab>", ":e " .. BOOKMARK_FILE .. "<CR>")
nmap("<C-Space>", function() promptBookmarkedFile(true) end)
nmap("<C-S-Space>", function() promptBookmarkedFile(false) end)
