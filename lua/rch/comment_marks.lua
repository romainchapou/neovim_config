local M = {}

-- Add a syntax match for special marks in comments

function M.load()
    vim.schedule(function()
      vim.cmd([[autocmd Syntax * syntax match myCommentMarks '[ (]\zs@\(API\|Optim\|Improve\|Refactor\|Incomplete\|Unsure\|Bug\|Hack\|Cleanup\|tmp\|Hardcoded\|Test\)\>:\?' containedin=ALL]])

      vim.cmd([[autocmd Syntax vimwiki syntax match markdownStartTag '\%(^\)\@<!#start\>' containedin=ALL]])
      vim.cmd([[autocmd Syntax vimwiki syntax match markdownCurrentTag '\%(^\)\@<!#current\>' containedin=ALL]])
      vim.cmd([[autocmd Syntax vimwiki syntax match markdownTags '\%(^\)\@<!#\w\+' containedin=ALL]])
    end)
end

return M
