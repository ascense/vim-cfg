local lspconfig = require('lspconfig')

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Set client_capabilities for ddc-source-nvim-lsp
local capabilities = require("ddc_nvim_lsp").make_client_capabilities()

-- CCLS
lspconfig.ccls.setup {
  on_attach = on_attach,
  flags = {},
  capabilities = capabilities
}

-- eslint
lspconfig.eslint.setup {
  capabilities = capabilities
}

-- typescript
lspconfig.tsserver.setup {
  capabilities = capabilities
}

-- Tailwind CSS
lspconfig.tailwindcss.setup {
  capabilities = capabilities
}
