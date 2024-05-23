local config = require("nvchad.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- The line below should be added in order to not getting the warning:
-- multiple different client offset_encodings detected for buffer, this is not supported yet
capabilities.offsetEncoding = { "utf-16" }

local servers = {
  tsserver = {
    init_options = {
      preferences = {
        disableSuggestions = true,
      }
    }
  },
  pyright = {
    filetypes = { "python" }
  },
  clangd = {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      config.on_attach(client, bufnr)
    end
  },
  html = {
    filetypes = { "html", "templ" }
  },
  stimulus_ls = {}
}

for name, opts in pairs(servers) do
  -- Apply common configuration settings
  opts.on_init = config.on_init
  -- Only set on_attach if it is not already set in the specific configuration
  if not opts.on_attach then
    opts.on_attach = config.on_attach
  end
  opts.capabilities = capabilities

  lspconfig[name].setup(opts)
end
