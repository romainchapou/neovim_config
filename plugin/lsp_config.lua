if os.getenv("NVIM_NO_LSP") then return end

-- function copied from nvim-lspconfig
-- should only work for clangd
local function clangd_switch_source_header(bufnr, client)
  local method_name = 'textDocument/switchSourceHeader'

  if not client or not client:supports_method(method_name) then
    return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
  end
  local params = vim.lsp.util.make_text_document_params(bufnr)

  client:request(method_name, params, function(err, result)
    if err then
      error(tostring(err))
    end
    if not result then
      vim.notify('corresponding file cannot be determined')
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

local nmap = require("rch.utils").nmap

local function go_to_prev_diagnostic()
  if vim.o.spell then
    vim.cmd("normal [s")
  else
    vim.diagnostic.jump({count = -1, float = true})
  end
end

local function go_to_next_diagnostic()
  if vim.o.spell then
    vim.cmd("normal ]s")
  else
    vim.diagnostic.jump({count = 1, float = true})
  end
end

nmap("<leader>R", ":LspRestart<cr>")

vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false,

    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '⚡',
        [vim.diagnostic.severity.HINT] = '',
        [vim.diagnostic.severity.INFO] = '',
      },
    },
})

-- require'toggle_lsp_diagnostics'.init({ update_in_insert = false, virtual_text = false })

-- Only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('on-lsp-attach', { clear = true }),
    callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

      -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = event.buf })

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=event.buf }
      nmap('gd', vim.lsp.buf.definition, bufopts)
      nmap('gk', vim.lsp.buf.hover, bufopts)
      nmap('gD', vim.lsp.buf.type_definition, bufopts)
      nmap('gR', vim.lsp.buf.rename, bufopts)
      nmap('ga', vim.lsp.buf.code_action, bufopts)
      nmap('gr', vim.lsp.buf.references, bufopts)

      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      nmap('<leader>zd', vim.diagnostic.open_float, bufopts)
      nmap('<m-h>', go_to_prev_diagnostic, bufopts)
      nmap('<m-l>', go_to_next_diagnostic, bufopts)
      nmap('<leader>zl', vim.diagnostic.setloclist, bufopts)

      nmap('_', ":FzfLua lsp_document_symbols<cr>", bufopts)
      nmap('-', ":FzfLua lsp_workspace_symbols<cr>", bufopts)

      if client ~= nil then
        client.server_capabilities.semanticTokensProvider = nil

        if client.name == "clangd" then
          nmap('gh', function()
            clangd_switch_source_header(event.buf, client)
          end, bufopts)
        end
      end
    end,
})

vim.lsp.config.pylsp = {
    cmd = { 'pylsp' },
    root_markers = { '.git' },
    filetypes = { 'python' },

    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    },
}
vim.lsp.enable("pylsp")

vim.lsp.config.glsl_analyzer = {
    cmd = { 'glsl_analyzer' },
    root_markers = { '.git' },
    filetypes = { 'glsl', 'vert', 'tesc', 'tese', 'frag', 'geom', 'comp' },
}
vim.lsp.enable("glsl_analyzer")

vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    root_markers = { '.git' },
    filetypes = { 'lua' },

    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
}
vim.lsp.enable("lua_ls")

vim.lsp.config.clangd = {
    cmd = { 'clangd' },
    root_markers = { 'compile_commands.json', '.git' },
    filetypes = { 'c', 'cpp' },
}
vim.lsp.enable("clangd")
