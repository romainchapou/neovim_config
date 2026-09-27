-- Working with my zsh config to change the cwd when exiting nvim in a few scenarios


local choosedir_file = os.getenv("NVIM_CHOOSEDIR")

if choosedir_file == nil then return end


local function write_working_dir_to_file(cwd_path)
  vim.fn.writefile({cwd_path}, choosedir_file, "")
end

vim.api.nvim_create_autocmd('DirChanged', {
  pattern = 'global',
  callback = function(ev) write_working_dir_to_file(ev.file) end
})

vim.api.nvim_create_autocmd('ExitPre', {
  callback = function(ev)
    local oil_exit_dir = require("oil").get_current_dir(ev.buf)

    if oil_exit_dir ~= nil then
      write_working_dir_to_file(oil_exit_dir)
    end
  end
})
