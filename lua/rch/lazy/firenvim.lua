return {
  {
      'glacambre/firenvim',

      -- Lazy load firenvim
      -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
      lazy = not vim.g.started_by_firenvim,
      build = function()
          vim.fn["firenvim#install"](0)
      end,

      config = function()
        vim.g.firenvim_config = {
            localSettings = {
                ['.*'] = {
                    priority = 0,
                    takeover = 'never'
                }
            }
        }

        if vim.g.started_by_firenvim == true then
          vim.o.laststatus = 0
        else
          vim.o.laststatus = 2
        end
      end
  },
}
