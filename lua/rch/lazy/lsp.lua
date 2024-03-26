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
      end,
      build = function()
        -- local cpptoolspath = vim.fn.stdpath("data") .. "/rch/cpptools"
        -- if not vim.loop.fs_stat(lazypath) then
        --   vim.fn.system({
        --     "git",
        --     "clone",
        --     "--filter=blob:none",
        --     "https://github.com/folke/lazy.nvim.git",
        --     "--branch=stable", -- latest stable release
        --     lazypath,
        --   })
        -- end
      end
    },
  }
end

return M
