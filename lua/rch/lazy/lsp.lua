local M = {}

if not os.getenv("NVIM_NO_LSP") then
  M = {
    {
      "neovim/nvim-lspconfig", ft = {"cpp", "c", "lua"}, config = function()
        require("rch.lsp_config")
      end
    },
    {
      -- TODO proper build function to download the required debugger plugin
      "mfussenegger/nvim-dap", ft = {"cpp", "c"}, config = function()
        require("rch.dap_config")
      end
    },
  }
end

return M
