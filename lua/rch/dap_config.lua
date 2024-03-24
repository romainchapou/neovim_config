local nmap = require("rch.utils").nmap

local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")

nmap("<backspace>c", dap.continue)

nmap("<backspace>o", dap.repl.toggle)
nmap("<backspace>n", dap.step_over)
nmap("<backspace>s", dap.step_into)
nmap("<backspace>u", dap.up)
nmap("<backspace>d", dap.down)
nmap("<backspace>p", dap.pause)
nmap("<backspace>O", dap.step_out)
nmap("<backspace>b", dap.toggle_breakpoint)

nmap("<backspace>C", dap.run_to_cursor)
nmap("<backspace>e", dap.set_exception_breakpoints)
nmap("<backspace>q", dap.terminate)
nmap("<backspace>l", dap.list_breakpoints)
nmap("<backspace>Q", dap.clear_breakpoints)
nmap("<backspace>E", function() dap.set_exception_breakpoints({"all"}) end)

nmap("<backspace>h", dap_widgets.hover)
nmap("<backspace>h", dap_widgets.hover)

nmap("<backspace>ap", dap_widgets.preview)
nmap("<backspace>ap", dap_widgets.preview)

nmap("<backspace>C", dap.run_to_cursor)
nmap("<backspace>e", dap.set_exception_breakpoints)
nmap("<backspace>q", dap.terminate)
nmap("<backspace>l", dap.list_breakpoints)
nmap("<backspace>Q", dap.clear_breakpoints)
nmap("<backspace>t", function() dap_widgets.centered_float(dap_widgets.frames) end)
nmap("<backspace>v", function() dap_widgets.centered_float(dap_widgets.scopes) end)

local function run_shell_command(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  -- TODO remove only the last line break
  return string.gsub(result, "\n", "")
end

-- See https://github.com/mfussenegger/nvim-dap()/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv("HOME") .. '/Documents/projects/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- TODO @Cleanup

local function mysplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      local exec_file = require("confiture").get_command("exec")

      if exec_file == nil then
          return vim.fn.input('No exec var in confiture file, please provide path to executable: ',
                              vim.fn.getcwd() .. '/', 'file')
      else
        -- TODO see if really needed
        return run_shell_command('readlink -f ' .. exec_file)
      end
    end,
    args = function()
      local exec_args = require("confiture").get_command("exec_args")

      if exec_args == "" or exec_args == nil then
        return {}
      else
        -- TODO @Hack: this is not a proper parsing
        return mysplit(exec_args)
      end
    end,
    environment = {{name = "TEST_VAR", value = "test value"}},
    cwd = '${workspaceFolder}',
    setupCommands = {
      {
        description = 'enable pretty printing',
        text = '-enable-pretty-printing',
        -- ignoreFailures = true
      },
    },
    stopAtEntry = true,
  },
}


nmap('<backspace><cr>', function()
  vim.api.nvim_command("silent! wa")

  require("confiture").set_variable("build_type", "Debug")

  local build_success = require("confiture").build_and_return_success()

  if not build_success then
    print("build failed, not debbuging")
    return
  end

  vim.api.nvim_feedkeys("<cr>", 'n', false)
  require('dap').continue()
end)
