local function get_oil_current_file()
  local current_file = require("oil").get_cursor_entry().parsed_name
  local current_path = require("oil").get_current_dir()
  return '"' .. current_path .. current_file .. '"'
end

local function select_callback()
  local file = get_oil_current_file()
  local cmd = 'outfile=$(readlink -f ' .. file .. ' | xargs -I{} file --mime "{}") ; [ -d ' .. file .. ' ] || echo "$outfile" | grep -vq charset=binary || echo "$outfile" | grep -q "inode/x-empty;"'

  if os.execute(cmd) == 0 then
    return require("oil.actions").select.callback()
  else
    return require("oil.actions").open_external.callback()
  end
end

local function copy_path_callback()
  vim.fn.setreg("+", get_oil_current_file())
end

return {
  -- {
  --   "lambdalisue/fern.vim",
  --   dependencies = "lambdalisue/fern-hijack.vim"
  -- },
  {
    'https://github.com/stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        skip_confirm_for_simple_edits = true,
        watch_for_changes = true,
        keymaps = {
          ["<C-p>"] = false,
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["gy"] = { callback = copy_path_callback },
          ["<M-h>"] = "actions.select_split", -- TODO
          ["<M-l>"] = "actions.refresh",
          ["gC"] = "actions.cd",
          ["<backspace>"] = "actions.parent",
          ["<M-k>"] = { callback = select_callback },
          ["<CR>"] = { callback = select_callback },
          ["<M-j>"] = "actions.parent",
          ["<tab>"] = "<c-^>",
        },
      }
    end
  },
}
