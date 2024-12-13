local nmap = require("rch.utils").nmap

local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")

nmap("<backspace>c", dap.continue)

nmap("<backspace>o", dap.repl.toggle)
nmap("<backspace>n", dap.step_over)
nmap("<backspace>s", dap.step_into)
nmap("<backspace>u", dap.up)
nmap("<backspace>d", dap.down)
nmap("<backspace>p", function() dap.pause({}) end)
nmap("<backspace>O", dap.step_out)
nmap("<backspace>b", dap.toggle_breakpoint)

nmap("<backspace>h", dap_widgets.hover)
nmap("<backspace>ap", dap_widgets.preview)

nmap("<backspace>C", dap.run_to_cursor)
nmap("<backspace>e", dap.set_exception_breakpoints)
nmap("<backspace>E", function() dap.set_exception_breakpoints({"all"}) end)
nmap("<backspace>q", dap.terminate)
nmap("<backspace>l", dap.list_breakpoints)
nmap("<backspace>Q", dap.clear_breakpoints)
nmap("<backspace>t", function() dap_widgets.centered_float(dap_widgets.frames) end)
nmap("<backspace>T", function() dap_widgets.sidebar(dap_widgets.frames).open() end)
nmap("<backspace>v", function() dap_widgets.centered_float(dap_widgets.scopes) end)
nmap("<backspace>V", function() dap_widgets.sidebar(dap_widgets.scopes).open() end)

nmap("<S-M-K>", dap.down)
nmap("<S-M-J>", dap.up)

local function run_shell_command(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  -- TODO remove only the last line break
  return string.gsub(result, "\n", "")
end

-- note that this need a recent version of gdb that supports dap
dap.adapters.gdb = {
  id = 'gdb',
  type = 'executable',
  command = 'gdb',
  args = { '--quiet', '--interpreter=dap' }
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
    type = "gdb",
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

  require("confiture").async_build_and_exec_on_success(function()
    require('dap').continue()
  end)
end)
