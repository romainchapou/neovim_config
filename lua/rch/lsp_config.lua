local nmap = require("rch.utils").nmap

if not os.getenv("NVIM_NO_LSP") then
  vim.diagnostic.config({ update_in_insert = false, virtual_text = false })
  -- require'toggle_lsp_diagnostics'.init({ update_in_insert = false, virtual_text = false })

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  nmap('<leader>vd', vim.diagnostic.open_float)
  nmap('<m-h>', vim.diagnostic.goto_prev)
  nmap('<m-l>', vim.diagnostic.goto_next)
  nmap('<leader>vl', vim.diagnostic.setloclist)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    client.server_capabilities.semanticTokensProvider = nil

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    nmap('gd', vim.lsp.buf.definition, bufopts)
    nmap('gk', vim.lsp.buf.hover, bufopts)
    nmap('gD', vim.lsp.buf.type_definition, bufopts)
    nmap('gR', vim.lsp.buf.rename, bufopts)
    nmap('ga', vim.lsp.buf.code_action, bufopts)
    nmap('gr', vim.lsp.buf.references, bufopts)

    nmap('gh', function()
      vim.api.nvim_command(":ClangdSwitchSourceHeader")
    end, bufopts)

    nmap('_', ":FzfLua lsp_document_symbols<cr>", bufopts)
    nmap('-', ":FzfLua lsp_workspace_symbols<cr>", bufopts)
  end

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  require'lspconfig'.lua_ls.setup {
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

    on_attach = on_attach,
    flags = lsp_flags,
  }

  require('lspconfig').clangd.setup {
      on_attach = on_attach,
      flags = lsp_flags,
  }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

nmap("<leader>r", ":LspRestart<cr>")
