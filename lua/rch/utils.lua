local utils = {}

local function map(mode, lhs, rhs, opts)
  if not opts then
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true})
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function utils.nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function utils.xmap(lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

function utils.omap(lhs, rhs, opts)
  map('o', lhs, rhs, opts)
end

return utils
