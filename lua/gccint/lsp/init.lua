local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "gccint.lsp.mason"
require "gccint.lsp.diagnosticls-config"
require "gccint.lsp.null-ls"
require("gccint.lsp.handlers").setup()
