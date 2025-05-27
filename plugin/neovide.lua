-- neovide specific settings
if vim.g.neovide then
  local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1

  if is_windows then
    vim.o.guifont = "Cascadia Mono:h9"
  else
    vim.o.guifont = "CaskaydiaCove NFM:h8.5"
  end
end
