local M = {}

if not os.getenv("NVIM_NO_LSP") then
  M = {
    {
      "neovim/nvim-lspconfig", ft = {"cpp", "c", "lua", "python"}, config = function()
        require("rch.lsp_config")
      end
    },
    {
      "mfussenegger/nvim-dap", ft = {"cpp", "c"},
      config = function()
        require("rch.dap_config")
      end
    },
    {
      "rcarriga/nvim-dap-ui", ft = {"cpp", "c"},
      dependencies = { "nvim-neotest/nvim-nio" },
      config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      end
    }
  }
end

return M
